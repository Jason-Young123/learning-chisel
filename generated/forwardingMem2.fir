FIRRTL version 1.2.0
circuit forwardingMem2 :
  module forwardingMem2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip raddr : UInt<10>, rdata : UInt<8>, flip wen : UInt<1>, flip waddr : UInt<10>, flip wdata : UInt<8>} @[src/main/scala/Seq/mem.scala 65:14]

    smem fdmem : UInt<8> [1024] @[src/main/scala/Seq/mem.scala 73:26]
    wire _rdata_WIRE : UInt @[src/main/scala/Seq/mem.scala 75:25]
    _rdata_WIRE is invalid @[src/main/scala/Seq/mem.scala 75:25]
    when UInt<1>("h1") : @[src/main/scala/Seq/mem.scala 75:25]
      _rdata_WIRE <= io.raddr @[src/main/scala/Seq/mem.scala 75:25]
      node _rdata_T = or(_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 75:25]
      node _rdata_T_1 = bits(_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 75:25]
      read mport rdata = fdmem[_rdata_T_1], clock @[src/main/scala/Seq/mem.scala 75:25]
    when io.wen : @[src/main/scala/Seq/mem.scala 77:15]
      write mport MPORT = fdmem[io.waddr], clock
      MPORT <= io.wdata
    reg wdataReg : UInt, clock with :
      reset => (UInt<1>("h0"), wdataReg) @[src/main/scala/Seq/mem.scala 81:25]
    wdataReg <= io.wdata @[src/main/scala/Seq/mem.scala 81:25]
    node _doForwardReg_T = eq(io.waddr, io.raddr) @[src/main/scala/Seq/mem.scala 82:39]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io.wen) @[src/main/scala/Seq/mem.scala 82:52]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[src/main/scala/Seq/mem.scala 82:29]
    doForwardReg <= _doForwardReg_T_1 @[src/main/scala/Seq/mem.scala 82:29]
    node _io_rdata_T = mux(doForwardReg, wdataReg, rdata) @[src/main/scala/Seq/mem.scala 83:18]
    io.rdata <= _io_rdata_T @[src/main/scala/Seq/mem.scala 83:12]

