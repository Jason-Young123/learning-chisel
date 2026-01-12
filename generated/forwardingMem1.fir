FIRRTL version 1.2.0
circuit forwardingMem1 :
  module forwardingMem1 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip raddr : UInt<10>, rdata : UInt<8>, flip wen : UInt<1>, flip waddr : UInt<10>, flip wdata : UInt<8>} @[src/main/scala/Seq/mem.scala 26:14]

    smem fdmem : UInt<8> [1024] @[src/main/scala/Seq/mem.scala 36:26]
    wire _rdata_WIRE : UInt @[src/main/scala/Seq/mem.scala 38:25]
    _rdata_WIRE is invalid @[src/main/scala/Seq/mem.scala 38:25]
    when UInt<1>("h1") : @[src/main/scala/Seq/mem.scala 38:25]
      _rdata_WIRE <= io.raddr @[src/main/scala/Seq/mem.scala 38:25]
      node _rdata_T = or(_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 38:25]
      node _rdata_T_1 = bits(_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 38:25]
      read mport rdata = fdmem[_rdata_T_1], clock @[src/main/scala/Seq/mem.scala 38:25]
    when io.wen : @[src/main/scala/Seq/mem.scala 40:15]
      write mport MPORT = fdmem[io.waddr], clock
      MPORT <= io.wdata
    node _T = eq(io.raddr, io.waddr) @[src/main/scala/Seq/mem.scala 53:27]
    node _T_1 = and(io.wen, _T) @[src/main/scala/Seq/mem.scala 53:15]
    when _T_1 : @[src/main/scala/Seq/mem.scala 53:40]
      reg io_rdata_REG : UInt, clock with :
        reset => (UInt<1>("h0"), io_rdata_REG) @[src/main/scala/Seq/mem.scala 54:24]
      io_rdata_REG <= io.wdata @[src/main/scala/Seq/mem.scala 54:24]
      io.rdata <= io_rdata_REG @[src/main/scala/Seq/mem.scala 54:14]
    else :
      io.rdata <= rdata @[src/main/scala/Seq/mem.scala 56:14]


