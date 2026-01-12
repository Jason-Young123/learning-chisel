val a = Bits()
val b = Bits()
val w = a & b


val a = Wire(UInt())
val b = Wire(UInt())
val w = a & b


val a = Wire(Bits())
val b = Wire(Bits())
val w = Wire(Bits())
w := a & b
//创立时赋值用 =,创建后赋值用 :=



//有关寄存器创建:
//1. 最完整、最明确的寄存器声明
val reg1 = RegInit(0.U(8.W))
reg1 := io.input  // 必须手动连接
// 等价硬件描述：
// "创建一个8位寄存器，复位值为0，连接到io.input"


//2. 基本的寄存器声明（不推荐单独使用）
val reg2 = Reg(UInt(8.W))
reg2 := io.input  // 必须手动连接
// 等价硬件描述：
// "创建一个8位寄存器，连接到io.input，但上电值不确定"


//3. 一步完成的寄存器创建+连接
val reg3 = RegNext(io.input, 0.U)  // 类型从io.input推断
// 等价硬件描述：
// "创建一个寄存器，输入为io.input，复位值为0"
// 等价于：
// val reg3 = RegInit(0.U(8.W))
// reg3 := io.input





//有关Bundle,不同信号的打包
val ch = Wire(new Channel())
ch.data := 123.U
ch.valid := true.B

val b = ch.valid
val ch2 = ch

//vec,同一类型信号的打包
val regs = Reg(Vec(32, UInt(32.W)))//创建32个平行的32位寄存器
val idx = 1.U(2.W)//索引
regs(idx) := dIn//写第idx个寄存器
val dOut = regs(idx)//读第idx个寄存器

//混合使用
val vecBundle = Wire(Vec(8, new Channel()))
class BundleVec extends Bundle {
  val field = UInt(8.W)
  val vector = Vec(4, UInt(8.W))
}






































