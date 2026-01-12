import chisel3._
import chisel3.util._

//1. := 可以代表 always中的<=, =,也可以代表assign
//2. when可以描述时序也可以描述组合逻辑

class wire extends Module {
  val io = IO(new Bundle{
    val a = Input(Bool())
    val b = Input(Bool())
    val cond = Input(Bool())
    val y = Output(Bool())
  })

  //纯组合逻辑的动态表述(类似verilog中组合逻辑用always @(*) 建模)

  //assign w1 = io.cond ? 2'b11 : 2'b00
  //val w1 = Wire(UInt(2.W))
  //w1 := 0.U
  //上述两行可合并为:
  val w1 = WireDefault(0.U(2.W))
  when (io.cond) {
    w1 := 3.U
  }

  //assign w2 = io.cond ? 2'b01 : 2'b10
  val w2 = Wire(UInt(2.W))
  when (io.cond){
    w2 := 1.U
  } .otherwise{
    w2 := 2.U
  }

  //
  val w3 = Wire(UInt(2.W))
  when (io.cond) {
    w3 := 1.U
  } .elsewhen (w1.andR) {//按位and规约,返回类型为bool
    w3 := 2.U
  } .elsewhen (w2(0)) {//取指定位,返回类型为bool
    w3 := 3.U
  } .otherwise {
    w3 := 0.U
  }


  when (w3 === 2.U || w3 === 3.U){//注意比较判断是===和=/=
    io.y := io.a
  } .elsewhen (w3 === 1.U){
    io.y := io.b
  } .otherwise {
    io.y := io.a & io.b
  }

}




//导出
object wireGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new wire(), Array("--target-dir", "generated")
  )
}

