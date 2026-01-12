import chisel3._
import chisel3.util._


object MySigProcessingTricks {
  //1.用双级寄存器处理异步信号输入:防止采样在了异步信号的边沿上
  def sync(in:Bool) :Bool = RegNext(RegNext(in))

  //2.生成低频采样信号(采样间隔>=bouncing时间):防止采样在了bouncing信号的jitter段
  def tickGen(fac:UInt) :Bool = {
    val cntReg = RegInit(0.U((fac.getWidth).W))
    val tick = (cntReg === fac)
    cntReg := Mux(tick, 0.U, cntReg + 1.U)
    tick
  }

  //3.对输入信号滤波,即对连续采样几次的信号进行投票以确定最终采样结果
  def filter(in: Bool, tick: Bool) :Bool = {
    val shiftReg = RegInit(0.U(3.W))
    when(tick){//低频采样信号,避免bouncing段干扰
      shiftReg := Cat(shiftReg(1, 0), in)
    }
    (shiftReg(2) & shiftReg(1)) | (shiftReg(2) & shiftReg(0)) | (shiftReg(1) & shiftReg(1))
  }

  //auxiliary
  def rising(in:Bool) :Bool = in & !RegNext(in)

}



class tricks extends Module{
  val io = IO(new Bundle{
    val btn_async = Input(Bool())//假设跨时钟域传来一个包含bouncing段的button信号
    val btn_out = Output(Bool())
    val cnt = Output(UInt(4.W))//由纯净的btn_out驱动
  })

  import MySigProcessingTricks._

  //step1:跨时钟域接收输入信号,确保传入本时钟域后不会因为采样问题而出现metastability
  val btn_sync = sync(io.btn_async)

  //step2:对同步后的信号进行去bouncing处理
  val tick = tickGen(10.U)//假设本时钟域时钟周期是btn time of bouncing的1/10,生成低频采样信号tick
  val btn_debounce = Reg(Bool())
  when(tick){
    btn_debounce := btn_sync
  }

  //step3:对去bouncing后的信号进行滤波(btn信号可能本身存在噪声),仍用低频采样信号tick
  val btn_filtered = filter(btn_debounce, tick)
  io.btn_out := btn_filtered

  //此时可以用debounce和filter后的纯净btn信号驱动计数器
  val risingEdge = rising(btn_filtered)//首先检测btn_out的上升沿

  val reg = RegInit(0.U(4.W))
  when(risingEdge){
    reg := reg + 1.U
  }
  io.cnt := reg

}



//导出
object tricksGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new tricks, Array("--target-dir", "generated")
  )
}








