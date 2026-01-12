import chisel3._
import chisel3.util._


class regs extends Module {
  val io = IO(new Bundle{
    val in = Input(UInt(8.W))
    val en = Input(Bool())
    val out = Output(UInt(8.W))
  })
  
  //单步(生成并使用)
  val reg0 = RegNext(io.in(0))

  //双步(先生成后使用)
  val reg1 = Reg(Bool())//或者UInt(1.W)
  reg1 := io.in(1)

  //带复位初始化;没有初始化默认为0
  val reg2 = RegInit(true.B)
  reg2 := io.in(2)

  //带使能
  val reg3 = Reg(Bool())
  when(io.en){
    reg3 := io.in(3)
  }

  //带使能+复位初始化
  val reg4 = RegInit(false.B)
  when(io.en){
    reg4 := io.in(4)
  }

  val risingEdge = io.in(5) & !RegNext(io.in(5))

  io.out := Cat(0.U(2.W), risingEdge, reg4, reg3, reg2, reg1, reg0)
}


//对比延时(以下延迟的第一个cycle可能为半个时钟周期,取决于a与clock沿的变化情况)
class regDelay extends Module{
  val io = IO(new Bundle{
    val a = Input(Bool())
    val b1 = Output(Bool())
    val b2 = Output(Bool())
    val b3 = Output(Bool())
    val b4 = Output(Bool())
  })
  
  //多引入一级寄存器
  val myreg1 = RegInit(false.B)
  val myreg2 = RegInit(false.B)
  myreg1 := io.a//延迟1 cycle,用wire驱动Reg
  myreg2 := RegNext(io.a)//延迟2 cycle,用RegNext驱动Reg
  
  io.b1 := myreg1//b1相较a延迟1 cycle
  io.b2 := myreg2//b2相较a延迟2 cycle
  
  //直接驱动
  io.b3 := io.a//assign b3 = a,无延迟,用wire驱动wire
  io.b4 := RegNext(io.a)//b4相较a延迟1 cycle,用RegNext驱动wire,延时来自RegNext

  // 延迟出现的情况:  (1)被驱动对象(左值)为reg类型
  //                  (2)驱动对象(右值)被放在RegNext中
  // a(wire) := b(wire/reg)             delay(b, a) = 0
  // a(reg)  := b(wire/reg)             delay(b, a) = 1
  // a(wire) := RegNext(b(wire/reg))    delay(b, a) = 1
  // a(reg)  := RegNext(b(wire/reg))    delay(b, a) = 2
}




//导出(注意为object extends App而非class)
object regsGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new regDelay(), Array("--target-dir", "generated")
  )
}




