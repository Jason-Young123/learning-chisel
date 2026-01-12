FIRRTL version 1.2.0
circuit regs :
  module regs :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, flip en : UInt<1>, out : UInt<8>} @[src/main/scala/Seq/regs.scala 6:14]

    node _reg0_T = bits(io.in, 0, 0) @[src/main/scala/Seq/regs.scala 13:27]
    reg reg0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg0) @[src/main/scala/Seq/regs.scala 13:21]
    reg0 <= _reg0_T @[src/main/scala/Seq/regs.scala 13:21]
    reg reg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg1) @[src/main/scala/Seq/regs.scala 16:17]
    node _reg1_T = bits(io.in, 1, 1) @[src/main/scala/Seq/regs.scala 17:16]
    reg1 <= _reg1_T @[src/main/scala/Seq/regs.scala 17:8]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/Seq/regs.scala 20:21]
    node _reg2_T = bits(io.in, 2, 2) @[src/main/scala/Seq/regs.scala 21:16]
    reg2 <= _reg2_T @[src/main/scala/Seq/regs.scala 21:8]
    reg reg3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg3) @[src/main/scala/Seq/regs.scala 24:17]
    when io.en : @[src/main/scala/Seq/regs.scala 25:14]
      node _reg3_T = bits(io.in, 3, 3) @[src/main/scala/Seq/regs.scala 26:18]
      reg3 <= _reg3_T @[src/main/scala/Seq/regs.scala 26:10]
    reg reg4 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/Seq/regs.scala 30:21]
    when io.en : @[src/main/scala/Seq/regs.scala 31:14]
      node _reg4_T = bits(io.in, 4, 4) @[src/main/scala/Seq/regs.scala 32:18]
      reg4 <= _reg4_T @[src/main/scala/Seq/regs.scala 32:10]
    node _risingEdge_T = bits(io.in, 5, 5) @[src/main/scala/Seq/regs.scala 35:25]
    node _risingEdge_T_1 = bits(io.in, 5, 5) @[src/main/scala/Seq/regs.scala 35:45]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[src/main/scala/Seq/regs.scala 35:39]
    risingEdge_REG <= _risingEdge_T_1 @[src/main/scala/Seq/regs.scala 35:39]
    node _risingEdge_T_2 = eq(risingEdge_REG, UInt<1>("h0")) @[src/main/scala/Seq/regs.scala 35:31]
    node risingEdge = and(_risingEdge_T, _risingEdge_T_2) @[src/main/scala/Seq/regs.scala 35:29]
    node io_out_lo_hi = cat(reg2, reg1) @[src/main/scala/Seq/regs.scala 37:16]
    node io_out_lo = cat(io_out_lo_hi, reg0) @[src/main/scala/Seq/regs.scala 37:16]
    node io_out_hi_lo = cat(reg4, reg3) @[src/main/scala/Seq/regs.scala 37:16]
    node io_out_hi_hi = cat(UInt<2>("h0"), risingEdge) @[src/main/scala/Seq/regs.scala 37:16]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[src/main/scala/Seq/regs.scala 37:16]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[src/main/scala/Seq/regs.scala 37:16]
    io.out <= _io_out_T @[src/main/scala/Seq/regs.scala 37:10]

