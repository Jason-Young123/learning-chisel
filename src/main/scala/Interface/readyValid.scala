import chisel3._
import chisel3.util._


//包含两组Ready-Valid协议接口的发送端
class Sender extends Module{
  val io = IO(new Bundle{
    val out1 = Decoupled(UInt(8.W))//DecoupledIO,基本Ready-Valid协议,使用最为灵活
    val out2 = Irrevocable(UInt(16.W))//IrrevocableIO,严格Ready-Valid协议,不允许过程中中断传输/改变数据
  })

  //some logic for sending data

}


//包含两组Ready-Valid协议接口的接收端
class Receiver extends Module{
  val io = IO(new Bundle{
    val in1 = Flipped(Decoupled(UInt(8.W)))
    val in2 = Flipped(Irrevocable(UInt(16.W)))
  })
  
  //some logic for receiving data

}
