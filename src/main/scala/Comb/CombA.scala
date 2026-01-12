import chisel3._
import chisel3.util._

class CombA extends Module {
  val io = IO(new Bundle{
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val x = Output(UInt(8.W))
    val y = Output(UInt(8.W))
  })

  io.x := io.a + io.b
  io.y := io.a - io.b

}


class CombB extends Module {
  val io = IO(new Bundle{
    val in1 = Input(UInt(8.W))
    val in2 = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })
  io.out := io.in1 + io.in2
}


class CombC extends Module {
  val io = IO(new Bundle{
    val in_a = Input(UInt(8.W))
    val in_b = Input(UInt(8.W))
    val in_c = Input(UInt(8.W))
    val out_x = Output(UInt(8.W))
    val out_y = Output(UInt(8.W))
  })

  //例化CombA和CombB
  val combA = Module(new CombA())
  val combB = Module(new CombB())

  //连接
  combA.io.a := io.in_a
  combA.io.b := io.in_b
  io.out_x := combA.io.x

  combB.io.in1 := combA.io.y
  combB.io.in2 := io.in_c
  io.out_y := combB.io.out
}





