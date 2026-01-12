import chisel3._
import chisel3.util._



//可以视为主FSM中的子FSM
class popCountDataPath extends Module{
  val io = IO(new Bundle{
    val din = Input(UInt(8.W))
    val load = Input(Bool())
    val popCnt = Output(UInt(4.W))
    val done = Output(Bool())
  })

  val dataReg = RegInit(0.U(8.W))//暂存输入数据
  val popCntReg = RegInit(0.U(8.W))//暂存popCnt结果
  val counterReg = RegInit(0.U(4.W))//计数已经数过的位数

  //等价于dataReg := Cat(0.U, dataReg(7,1))
  dataReg := 0.U ## dataReg(7,1)//默认条件下dataReg每周期右移1位
  popCntReg := popCntReg + dataReg(0)//默认条件下popCntReg每周期自加

  val done = (counterReg === 0.U)

  when(io.load){//特殊情况下,dataReg/popCntReg可以进行加载,此时覆盖之前的更新
    dataReg := io.din
    popCntReg := 0.U
    counterReg := 8.U
  } .otherwise{
    when(!done){
      counterReg := counterReg - 1.U
    }
  }

  io.popCnt := popCntReg
  io.done := done
}


//主FSM
class popCountFSM extends Module{
  val io = IO(new Bundle{
    val dinValid = Input(Bool())
    val dinReady = Output(Bool())
    val popCntValid = Output(Bool())
    val popCntReady = Input(Bool())
    val load = Output(Bool())//to popCntModule
    val done = Input(Bool())//from popCntModule
  })  

  val sIdle :: sCount :: sDone :: Nil = Enum(3)
  val state = RegInit(sIdle)

  switch(state){
    is(sIdle){//等待上级传入数据
      when(io.dinValid){
        state := sCount
      }
    }

    is(sCount){//等待DataPath计算完毕传出done信号
      when(io.done){
        state := sDone
      }
    }

    is(sDone){//等待下级将计算完毕的结果取走
      when(io.popCntReady){
        state := sIdle
      }
    }
  }

  io.dinReady := true.B//始终拉高
  io.popCntValid := (state === sDone)//等待下级取数据
  io.load := io.dinValid//确保在DataPath中dinValid(load)和din同步
}



//实际上就是标准的对上级和对下级的valid - ready - data接口,不过将data
//用单独的DataPath模块解偶而已
class FSMD extends Module{
  val io = IO(new Bundle{
    val dinValid = Input(Bool())
    val dinReady = Output(Bool())
    val din = Input(UInt(8.W))//由子FSM(DataPath子模块)接管
    val popCntValid = Output(Bool())
    val popCntReady = Input(Bool())
    val popCnt = Output(UInt(8.W))//由子FSM(DataPath子模块)接管
  })

  val main_fsm = Module(new popCountFSM())
  val data_fsm = Module(new popCountDataPath())

  //main_fsm与顶层信号互连
  main_fsm.io.dinValid := io.dinValid
  io.dinReady := main_fsm.io.dinReady
  io.popCntValid := main_fsm.io.popCntValid
  main_fsm.io.popCntReady := io.popCntReady

  //data_fsm与顶层信号互连
  data_fsm.io.din := io.din
  io.popCnt := data_fsm.io.popCnt

  //main_fsm与data_fsm互连
  data_fsm.io.load := main_fsm.io.load
  main_fsm.io.done := data_fsm.io.done

}




object FSMDGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new FSMD(), Array("--target-dir", "generated")
  )
}















