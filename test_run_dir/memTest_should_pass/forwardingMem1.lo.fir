FIRRTL version 1.2.0
circuit forwardingMem1 :
  module forwardingMem1 :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr : UInt<10> @[src/main/scala/Seq/mem.scala 26:14]
    output io_rdata : UInt<8> @[src/main/scala/Seq/mem.scala 26:14]
    input io_wen : UInt<1> @[src/main/scala/Seq/mem.scala 26:14]
    input io_waddr : UInt<10> @[src/main/scala/Seq/mem.scala 26:14]
    input io_wdata : UInt<8> @[src/main/scala/Seq/mem.scala 26:14]

    mem fdmem : @[src/main/scala/Seq/mem.scala 36:26]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => rdata
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(UInt<1>("h1"), io_raddr) @[src/main/scala/Seq/mem.scala 38:{25,25}]
    node _rdata_WIRE = _GEN_0 @[src/main/scala/Seq/mem.scala 38:25]
    node _rdata_T = or(_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 38:25]
    node _rdata_T_1 = bits(_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 38:25]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 38:{25,25} 36:26]
    node _GEN_2 = validif(UInt<1>("h1"), _rdata_T_1) @[src/main/scala/Seq/mem.scala 38:{25,25}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[src/main/scala/Seq/mem.scala 38:{25,25}]
    node _GEN_4 = validif(io_wen, io_waddr) @[src/main/scala/Seq/mem.scala 40:15]
    node _GEN_5 = validif(io_wen, clock) @[src/main/scala/Seq/mem.scala 40:15]
    node _GEN_6 = mux(io_wen, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 40:15 36:26]
    node _GEN_7 = validif(io_wen, UInt<1>("h1")) @[src/main/scala/Seq/mem.scala 40:15]
    node _GEN_8 = validif(io_wen, io_wdata) @[src/main/scala/Seq/mem.scala 40:15]
    node _T = eq(io_raddr, io_waddr) @[src/main/scala/Seq/mem.scala 53:27]
    node _T_1 = and(io_wen, _T) @[src/main/scala/Seq/mem.scala 53:15]
    reg io_rdata_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), io_rdata_REG) @[src/main/scala/Seq/mem.scala 54:24]
    node _GEN_9 = mux(_T_1, io_rdata_REG, fdmem.rdata.data) @[src/main/scala/Seq/mem.scala 53:40 54:14 56:14]
    io_rdata <= _GEN_9
    fdmem.rdata.addr <= _GEN_2
    fdmem.rdata.en <= _GEN_1
    fdmem.rdata.clk <= _GEN_3
    fdmem.MPORT.addr <= _GEN_4
    fdmem.MPORT.en <= _GEN_6
    fdmem.MPORT.clk <= _GEN_5
    fdmem.MPORT.data <= _GEN_8
    fdmem.MPORT.mask <= _GEN_7
    io_rdata_REG <= io_wdata @[src/main/scala/Seq/mem.scala 54:24]
