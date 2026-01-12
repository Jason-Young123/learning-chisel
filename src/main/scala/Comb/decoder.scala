import chisel3._
import chisel3.util._


//7-seg译码器
class decoder extends Module {
  val io = IO(new Bundle{
    val x = Input(UInt(4.W))
    val y = Output(UInt(8.W))
  })

  //注意即便switch语句中情形完备,输出结果仍然需要初始化
  io.y := "b00000000".U
  switch (io.x) {
    is ("b0000".U) { io.y := "b10010100".U}
    is ("b0001".U) { io.y := "b00110001".U}
    is ("b0010".U) { io.y := "b00100011".U}
    is ("b0011".U) { io.y := "b01001010".U}
    //....
    //case不完备,其他情况下y均取默认值
  }

}



object decoderGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new decoder(), Array("--target-dir", "generated")
  )
}

