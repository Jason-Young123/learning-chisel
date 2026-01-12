//foo2: 接口完全对称模块的级联(<>运算符)

import chisel3._
import chisel3.util._

//valid-ready接口协议,主机master端接口声明
class HandshakeIO extends Bundle {
  val data = Output(UInt(32.W))
  val valid = Output(Bool())
  val ready = Input(Bool())
}


//和verilog模块一样,Output要有驱动,Input可直接调用
class master extends Module {
  val io = IO(new HandshakeIO())
  
  //简单逻辑
  val dataReg = RegInit(0.U(32.W))
  io.data := PopCount(dataReg)
  io.valid := true.B

  when(io.ready && io.valid){
    dataReg := dataReg + 1.U
  }
}



class slave extends Module {
  val io = IO(Flipped(new HandshakeIO()))//注意Flipped
  
  //简单逻辑
  val receivedData = RegInit(0.U(32.W))
  io.ready := true.B

  when(io.ready && io.valid){
    receivedData := io.data
  }
}


//顶层,和文件同名
class foo2 extends Module {
  val mymaster = Module(new master())
  val myslave = Module(new slave)

  mymaster.io <> myslave.io
}


//导出
object foo2Gen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new foo2(), Array("--target-dir", "generated")
  )
}


