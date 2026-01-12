import chisel3._

class FlipFlop extends Module {
  val io = IO(new Bundle {
    val d = Input(Bool())  // 输入信号 D
    val q = Output(Bool()) // 输出信号 Q
  })

  // 隐式使用默认时钟
  val reg = RegInit(false.B)  // 定义寄存器，初始值为 false
  reg := io.d                 // 在每个时钟上升沿将 D 的值赋给寄存器
  io.q := reg                 // 输出寄存器的值
}

object FlipFlop extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new FlipFlop, Array("--target-dir", "generated"))
}

