import chisel3._
import chisel3.util._


//测试非阻塞赋值行为
class DUT2 extends Module{
  val io = IO(new Bundle{
    val en = Input(Bool())
    val o = Output(Bool())
    val o1 = Output(Bool())
  })
  
  val reg = RegInit(0.U(4.W))

  //用when描述时序逻辑,类似verilog中always @(posedge clk),内部均为<=非阻塞赋值
  when(io.en){
    reg := reg + 1.U
    when(reg === 6.U){
      reg := 0.U
    }
  }

  //用when描述组合逻辑,类似verilog中always @*, 内部均为=阻塞赋值
  val tmp = WireInit(false.B)
  when(io.en){
    tmp := reg(1)
    when(tmp){
      io.o1 := reg(2)
    } .otherwise{
      io.o1 := reg(3)
    }
  }.otherwise{
    io.o1 := 0.U//确保组合路径完备
  }

  io.o := reg(0)
}



object DUT2Gen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new DUT2(), Array("--target-dir", "generated")
  )
}
