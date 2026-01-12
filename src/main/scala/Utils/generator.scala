import chisel3._
import chisel3.util._

//最基本生成语法
class generator extends Module{
  val io = IO(new Bundle{
    val in = Input(Bool())
    val out = Output(Bool())
  })

  
  val shiftReg1 = RegInit(0.U(8.U))
  val shiftReg2 = RegInit(0.U(8.U))
  //用Cat的方式实现移位寄存器
  shiftReg1 := Cat(shiftReg1(6, 0), io.in)

  //用gen的方式实现
  shiftReg2(0) := io.in
  for(i <- 1 until 8){//until包头不包尾
    shiftReg2(i) := shiftReg2(i-1)
  }

  io.out := shiftReg1(7) & shiftReg2(6)

}
