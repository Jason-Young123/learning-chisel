import chisel3._
import chisel3.util._


//不可以和其他obj同名
object MyCounters {
  def up_counter(n:UInt) :UInt = {
    val cntReg = RegInit(0.U(4.W))
    cntReg := Mux(cntReg === n, 0.U, cntReg + 1.U)
    cntReg//函数返回值
  }
  def down_counter(n:UInt):UInt = {
    val cntReg = RegInit(0.U(4.W))
    cntReg := Mux(cntReg === 0.U, n, cntReg + 1.U)
    cntReg
  }
  def pwm(nrCycles:UInt, hiCycles:UInt) = {
    val cntReg = RegInit(0.U((nrCycles.getWidth).W))
    cntReg := Mux(cntReg === nrCycles, 0.U, cntReg + 1.U)
    hiCycles > cntReg//返回值为Bool
  }
}


//模块参数用Int/UInt
class counter extends Module {
  val io = IO(new Bundle{
    val en = Input(Bool())
    val dir = Input(Bool())
    val out = Output(UInt(4.W))
    val out1 = Output(UInt(4.W))
    val out2 = Output(UInt(4.W))
    val pwm_clk = Output(Bool())
    val mod_sig = Output(Bool())
  })

  //方式1: 直接定义
  val cntReg = RegInit(0.U(4.W))
  when(io.en){
    when(io.dir){
      cntReg := Mux(cntReg === 7.U, 0.U, cntReg + 1.U)
    } .otherwise{
      cntReg := Mux(cntReg === 0.U, 7.U, cntReg - 1.U)
    }
  }
  io.out := cntReg
  
  //方式2: 调用函数
  val upcnt = MyCounters.up_counter(11.U)
  io.out1 := upcnt


  //生成慢时钟并用慢时钟驱动其他信号
  val tickCntReg = RegInit(0.U(4.W))
  val tick = (tickCntReg === 10.U)
  tickCntReg := tickCntReg + 1.U
  when (tick) {
    tickCntReg := 0.U
  }

  val lowFrqCntReg = RegInit(0.U(4.W))
  when (tick) {
    lowFrqCntReg := lowFrqCntReg + 1.U
  }
  io.out2 := lowFrqCntReg

  //调用函数生成pwm波
  val dout = MyCounters.pwm(10.U, 3.U)
  io.pwm_clk := dout


  //波形调制
  val FREQ = 100000.U
  val MAX = FREQ/100.U
  val modulationReg = RegInit(0.U(32.W))
  val upReg = RegInit(true.B)

  //modulationReg始终在0->max->0间计数
  when (modulationReg < FREQ && upReg){
    modulationReg := modulationReg + 1.U
  } .elsewhen (modulationReg === FREQ && upReg){
    upReg := false.B
  } .elsewhen (modulationReg > 0.U && !upReg){
    modulationReg := modulationReg - 1.U
  } .otherwise{
    upReg := true.B
  }
  val sig = MyCounters.pwm(MAX, modulationReg/100.U)
  io.mod_sig := sig

}


//导出
object counterGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new counter, Array("--target-dir", "generated")
  )
}



