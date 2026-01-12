import chisel3._
import chisel3.util._


//1. 基本参数类,只有参数,无泛型
class paramAdder(n:Int) extends Module{
  require(n > 0, s"宽度n必须大于0，但得到$n")
  val io = IO(new Bundle{
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val c = Output(UInt(n.W))
    val carry = Output(Bool())
  })

  //不支持
  //{io.carry, io.c} := io.a +& io.b
  val sum = io.a +& io.b
  io.c := sum(n-1, 0)
  io.carry := sum(n)//提取无符号加法的carry位(对于有符号加法carry并无意义)

}



//自定义复杂类型
class ComplexIO extends Bundle{
  val d = UInt(10.W)
  val b = Bool()
}

//2. 泛型函数
object templateFunctions{
  def myMux[T <: Data](sel: Bool, tPath: T, fPath: T): T = {
    val ret = WireInit(fPath)//或者WireDefualt,含义一样
    when(sel){
      ret := tPath
    }
    ret
  }
}



class routeDataType extends Bundle{
  val data = UInt(16.W)
  val flag = Bool()
}

//3.泛型类
class NoCRouter[T <: Data](dt: T, n:Int) extends Module{
  val io = IO(new Bundle{//具备n个inPort,每个port传输类型为T(UInt/SInt/self-defined...)
    val inPort = Input(Vec(n, dt))
    val address = Input(Vec(n, UInt(8.W)))
    val outPort = Output(Vec(n, dt))
  })
  //some logic
  //....
}

//例化
//val router = Module(new NocRouter(new routeDataType, 3))




//top
class param extends Module{
  val io = IO(new Bundle{
    val sel = Input(Bool())
    val out1 = Output(UInt(4.W))
    val out2 = Output(SInt(4.W))
    val out3 = Output(UInt(10.W))
    
  })
  
  import templateFunctions._

  //用UInt驱动Mux
  val result1 = myMux(io.sel, 5.U, 10.U)
  io.out1 := result1

  //用SInt驱动Mux
  val result2 = myMux(!io.sel, -2.S, 5.S)
  io.out2 := result2

  //用自定义类型驱动Mux,注意需要将类型(ComplexIO)映射到硬件(Wire)上
  val tVal = Wire(new ComplexIO())
  val fVal = Wire(new ComplexIO())
  tVal.b := true.B
  tVal.d := 10.U
  fVal.b := false.B
  fVal.d := 14.U

  val result3 = myMux(io.sel, tVal, fVal)
  io.out3 := result3.d
}




object paramGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new param(), Array("--target-dir", "generated")
  )
}
