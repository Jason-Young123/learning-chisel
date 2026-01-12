import chisel3._
import chisel3.util._


//抽象父类
abstract class Ticker(n: Int) extends Module{
  val io = IO(new Bundle{
    val tick = Output(Bool())
  })
}



//子类1:向上计数器
class UpTicker(n: Int) extends Ticker(n){
  val cntReg = RegInit(0.U(8.W))
  
  /*when(cntReg === (n-1).U){
    cntReg := 0.U
  } .otherwise{
    cntReg := cntReg + 1.U
  }*/

  cntReg := Mux(cntReg === (n-1).U, 0.U, cntReg + 1.U)

  io.tick := (cntReg === (n-1).U)//直接使用父类的接口
}



//子类2: 向下计数器
class DownTicker(n: Int) extends Ticker(n){
  val cntReg = RegInit((n-1).U(8.W))

  cntReg := Mux(cntReg === 0.U, (n-1).U, cntReg - 1.U)

  io.tick := (cntReg === 0.U)
}



object inheritGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new UpTicker(20), Array("--target-dir", "generated")  
  )

  (new chisel3.stage.ChiselStage).emitVerilog(
    new DownTicker(30), Array("--target-dir", "generated")  
  )

}
