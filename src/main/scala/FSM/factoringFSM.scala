import chisel3._
import chisel3.util._



class masterFSM extends Module{
  val io = IO(new Bundle{
    val start = Input(Bool())
    val light = Output(Bool())
    val timerLoad = Output(Bool())//驱动timer进行load
    val timerSelect = Output(Bool())//驱动选择4/6 cycle, true代表6 cycle
    val timerDone = Input(Bool())//timer计时完毕信号
  })

  val off :: flash1 :: space1 :: flash2 :: space2 :: flash3 :: Nil = Enum(6)
  
  val state = RegInit(off)//初始化
 
  //只要在switch中被赋值的对象都需要被初始化
  //io.timerLoad := false.B
  //io.timerSelect := true.B
  
  switch(state){
    is(off){
      when(io.start){state := flash1}
    }

    is(flash1){//light保持on 6个周期
      when(io.timerDone){state := space1}
    }

    is(space1){//light保持off 4个周期
      when(io.timerDone){state := flash2}
    }

    is(flash2){
      when(io.timerDone){state := space2}
    }

    is(space2){
      when(io.timerDone){state := flash3}
    }

    is(flash3){
      when(io.timerDone){state := off}
    }
  }

  //output输出逻辑,仅与state有关(moore)
  io.light := (state === flash1 || state === flash2 || state === flash3)//3次亮灯
  io.timerSelect := (state === flash1 || state === flash2 || state === flash3)//亮灯时计数6 cycle
  io.timerLoad := (state =/= off)//除了off状态都load
  
}



//slave FSM,负责计时功能
class timerFSM extends Module {
  val io = IO(new Bundle{
    val timerLoad = Input(Bool())
    val timerSelect = Input(Bool())
    val timerDone = Output(Bool())
  })

  val timerReg = RegInit(0.U(4.W))
  
  //注意,Enum中变量必须小写开头
  val idle :: count :: done :: Nil = Enum(3)
  val state = RegInit(idle)

  //switch块内都是时序逻辑(被赋值变量都是寄存器类型)
  switch(state){
    is(idle){
      when(io.timerLoad){
        state := count
        timerReg := Mux(io.timerSelect, 4.U, 2.U)//要在目标周期基础上 - 2
      }
    }

    is(count){
      when(timerReg === 0.U){
        state := idle
      } .otherwise{
        timerReg := timerReg - 1.U
      }
    }

    //is(done){
    //  state := idle
    //}
  }

  //输出
  io.timerDone := (state === count) && (timerReg === 0.U)
}


//包含masterFSM和timerFSM,功能: 
//off -> light on 6 cycles -> light off 4 cycles -> ...
class factoringFSM extends Module {
  val io = IO(new Bundle{
    val start = Input(Bool())
    val light = Output(Bool())
  })

  //注意实例化module时需要使用Module()
  val myMasterFSM = Module(new masterFSM())
  val myTimerFSM = Module(new timerFSM())

  //子模块与顶层IO相连,满足用顶层输入驱动模块输入,用模块输出驱动顶层输出
  myMasterFSM.io.start := io.start//用总输入驱动模块输入
  io.light := myMasterFSM.io.light//用模块输出驱动总输出

  //子模块间互连,总是用某个模块的输出(右端)驱动某个模块的输入(左端)
  myTimerFSM.io.timerLoad := myMasterFSM.io.timerLoad
  myTimerFSM.io.timerSelect := myMasterFSM.io.timerSelect
  myMasterFSM.io.timerDone := myTimerFSM.io.timerDone

}



object factoringFSMGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new factoringFSM(), Array("--target-dir", "generated")
  )
}



