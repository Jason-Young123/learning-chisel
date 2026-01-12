import chisel3._
import chisel3.util._


//注意不能和其他文件中的函数同名
object MyHWFunctions{ 
  def add(a:UInt, b:UInt) :UInt = {a + b}
}



class funcHW extends Module{
  val io = IO(new Bundle{
    val vec = Input(Vec(4, UInt(8.W)))//输入为包含4个uint8的向量
    val o1 = Output(UInt(8.W))
    val o2 = Output(UInt(8.W))
    val o3 = Output(UInt(8.W))
    val o4 = Output(UInt(8.W))
  })
  
  import MyHWFunctions._
  io.o1 := io.vec.reduce(add)//实现vec(0) + vec(1) + vec(2) + vec(3)
  
  //等效写法1,anonymous函数
  io.o2 := io.vec.reduce(_ + _)

  //等效写法2
  io.o3 := io.vec(0) + io.vec(1) + io.vec(2) + io.vec(3)

  //改进写法,指定加法树链,采用二叉树规约求和,延迟更优
  io.o4 := io.vec.reduceTree(_ + _)

}


object funcHWGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new funcHW(), Array("--target-dir", "generated")
  )

}
