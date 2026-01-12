import chisel3._
import chisel3.util._



//等价于risingEdge = din & !RegNext(din)
//慎用mealy,通常用moore
class mealy extends Module{
  val io = IO(new Bundle{
    val din = Input(Bool())
    val risingEdge = Output(Bool())
    val risingEdge_ref = Output(Bool())
  })

  //参考
  io.risingEdge_ref := io.din & !RegNext(io.din)

  //用mealy状态机检测risingEdge
  val zero :: one :: Nil = Enum(2)

  val stateReg = RegInit(zero)

  //output
  io.risingEdge := false.B

  //next-state and output logic
  switch(stateReg){
    is(zero){
      when(io.din){
        stateReg := one//这里是寄存器模型,stateReg会在io.din变化后的下一个上升沿才会变化,类似<= 非阻塞赋值
        //或者可以理解为将one连接到stateReg这个寄存器的输入端,后续的更新时机取决于io.din沿的到来

        io.risingEdge := true.B//这里是组合逻辑模型,io.risingEdge会和io.din同步变化,类似=阻塞赋值
        //或者可以理解为将true连接到io.risingEdge信号,由于其是wire因此瞬时更新
      }
    }
    is(one){
      io.risingEdge := false.B
      when(!io.din){
        stateReg := zero
      }
    }
  }
}


object mealyGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new mealy(), Array("--target-dir", "generated")
  )

}



