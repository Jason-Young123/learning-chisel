import chisel3._
import chisel3.util._


class shiftregs extends Module {
  val io = IO(new Bundle{
    val serIn = Input(Bool())
    val paraIn = Input(UInt(4.W))
    val load = Input(Bool())
    val out = Output(UInt(4.W))
  })

  val outReg = RegInit(0.U(4.W))
  when (io.load){
    outReg := io.paraIn
  } .otherwise{
    outReg := Cat(outReg(2, 0), io.serIn)
  }
  
  io.out := outReg
}



//导出
object shiftregsGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new shiftregs, Array("--target-dir", "generated")
  )
}

