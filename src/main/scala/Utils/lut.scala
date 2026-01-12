import chisel3._
import chisel3.util._
import scala.io.Source



class lut extends Module{
  val io = IO(new Bundle{
    val address = Input(UInt(8.W))
    val data = Output(UInt(8.W))
  })

  //step1: 在scala语义下进行数据初始化,此处采用文件读取方式
  val array = new Array[Int](256)
  var idx = 0//注意var类型

  val url = getClass.getResource("/Utils/data.txt")
  val source = Source.fromURL(url)
  //val source = Source.fromFile("./data.txt")
  for(line <- source.getLines()){
    array(idx) = line.toInt
    idx += 1//注意采用 = 而非 :=
  }

  //step2:在chisel语义下建立硬件描述
  val table = VecInit(array.map(_.U(8.W)))
  io.data := table(io.address)
}


class BCDlut extends Module{
  val io = IO(new Bundle{
    val address = Input(UInt(8.W))
    val data = Output(UInt(8.W))
  })

  //step1: 在scala语义下进行数据初始化,此处采用直接赋值
  val array = new Array[Int](256)

  for(i <- 0 to 99){//包头包尾
    array(i) = ((i/10)<<4) + i%10
  }

  //step2: 在chisel语义下建立硬件描述
  val table = VecInit(array.map(_.U(8.W)))
  io.data := table(io.address)
}




object lutGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new lut(), Array("--target-dir", "generated")  
  )
}

