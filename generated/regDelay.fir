FIRRTL version 1.2.0
circuit regDelay :
  module regDelay :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, b1 : UInt<1>, b2 : UInt<1>, b3 : UInt<1>, b4 : UInt<1>} @[src/main/scala/Seq/regs.scala 43:14]

    reg myreg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/Seq/regs.scala 52:23]
    reg myreg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/Seq/regs.scala 53:23]
    myreg1 <= io.a @[src/main/scala/Seq/regs.scala 54:10]
    reg myreg2_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), myreg2_REG) @[src/main/scala/Seq/regs.scala 55:20]
    myreg2_REG <= io.a @[src/main/scala/Seq/regs.scala 55:20]
    myreg2 <= myreg2_REG @[src/main/scala/Seq/regs.scala 55:10]
    io.b1 <= myreg1 @[src/main/scala/Seq/regs.scala 57:9]
    io.b2 <= myreg2 @[src/main/scala/Seq/regs.scala 58:9]
    io.b3 <= io.a @[src/main/scala/Seq/regs.scala 61:9]
    reg io_b4_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_b4_REG) @[src/main/scala/Seq/regs.scala 62:19]
    io_b4_REG <= io.a @[src/main/scala/Seq/regs.scala 62:19]
    io.b4 <= io_b4_REG @[src/main/scala/Seq/regs.scala 62:9]

