FIRRTL version 1.2.0
circuit regDelay :
  module regDelay :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1> @[src/main/scala/Seq/regs.scala 43:14]
    output io_b1 : UInt<1> @[src/main/scala/Seq/regs.scala 43:14]
    output io_b2 : UInt<1> @[src/main/scala/Seq/regs.scala 43:14]
    output io_b3 : UInt<1> @[src/main/scala/Seq/regs.scala 43:14]
    output io_b4 : UInt<1> @[src/main/scala/Seq/regs.scala 43:14]

    reg myreg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), myreg1) @[src/main/scala/Seq/regs.scala 52:23]
    reg myreg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), myreg2) @[src/main/scala/Seq/regs.scala 53:23]
    reg myreg2_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), myreg2_REG) @[src/main/scala/Seq/regs.scala 55:20]
    reg io_b4_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_b4_REG) @[src/main/scala/Seq/regs.scala 62:19]
    io_b1 <= myreg1 @[src/main/scala/Seq/regs.scala 57:9]
    io_b2 <= myreg2 @[src/main/scala/Seq/regs.scala 58:9]
    io_b3 <= io_a @[src/main/scala/Seq/regs.scala 61:9]
    io_b4 <= io_b4_REG @[src/main/scala/Seq/regs.scala 62:9]
    myreg1 <= mux(reset, UInt<1>("h0"), io_a) @[src/main/scala/Seq/regs.scala 52:{23,23} 54:10]
    myreg2 <= mux(reset, UInt<1>("h0"), myreg2_REG) @[src/main/scala/Seq/regs.scala 53:{23,23} 55:10]
    myreg2_REG <= io_a @[src/main/scala/Seq/regs.scala 55:20]
    io_b4_REG <= io_a @[src/main/scala/Seq/regs.scala 62:19]
