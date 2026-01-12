import chisel3._
import chisel3.util._

//函数必须要定义在对象/类中
object MyFunctions {
  def adder(x:UInt, y:UInt) :UInt = { x + y }
  def delay(x:UInt) :UInt = RegNext(x)
}


class func extends Module {
  //或者也可以定义在类内部,推荐用private(不希望被继承)或protected(希望被子类继承)
  private def adder_private(x: UInt, y:UInt):UInt = {x + y}
  private def delay_private(x: UInt):UInt = RegNext(x)
  
  //调用外部定义的函数需要导入
  import MyFunctions._

  val io = IO(new Bundle{
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val c = Input(UInt(8.W))
    val d = Input(UInt(8.W))
    val y = Output(UInt(16.W))
  })
  
  val tmp1 = adder(io.a, io.b)
  val tmp2 = adder(io.c, io.d)
  val tmp3 = adder_private(tmp1, tmp2)

  io.y := delay_private(delay(tmp3))//寄存两周期输出
}


//导出
object funcGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new func(), Array("--target-dir", "generated")
  )
}

