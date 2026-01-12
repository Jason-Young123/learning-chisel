import chisel3._
import chisel3.util._


//最基本运算符,针对有符号和无符号数
class operator extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val c = Input(SInt(4.W))//模块内的Int要用SInt,和参数中不同
    val d = Input(SInt(4.W))
    val o1 = Output(UInt(4.W))
    val o2 = Output(UInt(5.W))
    val o3 = Output(SInt(4.W))
    val o4 = Output(SInt(5.W))
    val o5 = Output(UInt(4.W))
    val o6 = Output(UInt(8.W))
    val o7 = Output(SInt(4.W))
    val o8 = Output(SInt(8.W))
    val overflow1 = Output(Bool())
    val overflow2 = Output(Bool())
  })

  //加法
  //unsigned add, carry ignored(4b u + 4b u -> 4b u)
  io.o1 := io.a + io.b

  //unsigned add, carry considered(4b u + 4b u -> 5b u)
  io.o2 := io.a +& io.b

  //signed add, carry ignored, 常用方式, 并需要额外检测溢出(4b + 4b -> 4b)
  io.o3 := io.c + io.d
  io.overflow1 := (!io.c(3) && !io.d(3) && io.o3(3)) ||//正溢出
                  (io.c(3) && io.d(3) && !io.o3(3)) //负溢出

  //signed add, carry considered,但无意义,无法通过carry位判断溢出
  io.o4 := io.c +& io.d


  //乘法
  //unsigned mult, hi ignored(4b u * 4b u -> 4b u)
  io.o5 := io.a * io.b

  //unsigned mult, hi considered(4b u * 4b u -> 8b u)
  io.o6 := io.a * io.b

  //signed mult, hi ignored
  io.o7 := io.c * io.d

  //signed mult, hi considered
  io.o8 := io.c * io.d

  io.overflow2 := false.B//只要计算正确,用8bit存放两个4bit乘法是不会溢出的

}



class example extends Module{
  val io = IO(new Bundle{
    val a = Input(SInt(4.W))
    val b = Input(SInt(4.W))
    val o = Output(SInt(8.W))
  })

  io.o := io.a * io.b

}



object operatorGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new example(), Array("--target-dir", "generated")
  )
}
