FIRRTL version 1.2.0
circuit forwardingMem2 :
  module forwardingMem2 :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr : UInt<10> @[src/main/scala/Seq/mem.scala 63:14]
    output io_rdata : UInt<8> @[src/main/scala/Seq/mem.scala 63:14]
    input io_wen : UInt<1> @[src/main/scala/Seq/mem.scala 63:14]
    input io_waddr : UInt<10> @[src/main/scala/Seq/mem.scala 63:14]
    input io_wdata : UInt<8> @[src/main/scala/Seq/mem.scala 63:14]

    mem fdmem : @[src/main/scala/Seq/mem.scala 71:26]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => rdata
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(UInt<1>("h1"), io_raddr) @[src/main/scala/Seq/mem.scala 73:{25,25}]
    node _rdata_WIRE = _GEN_0 @[src/main/scala/Seq/mem.scala 73:25]
    node _rdata_T = or(_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 73:25]
    node _rdata_T_1 = bits(_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 73:25]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 73:{25,25} 71:26]
    node _GEN_2 = validif(UInt<1>("h1"), _rdata_T_1) @[src/main/scala/Seq/mem.scala 73:{25,25}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[src/main/scala/Seq/mem.scala 73:{25,25}]
    node _GEN_4 = validif(io_wen, io_waddr) @[src/main/scala/Seq/mem.scala 75:15]
    node _GEN_5 = validif(io_wen, clock) @[src/main/scala/Seq/mem.scala 75:15]
    node _GEN_6 = mux(io_wen, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 75:15 71:26]
    node _GEN_7 = validif(io_wen, UInt<1>("h1")) @[src/main/scala/Seq/mem.scala 75:15]
    node _GEN_8 = validif(io_wen, io_wdata) @[src/main/scala/Seq/mem.scala 75:15]
    reg wdataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wdataReg) @[src/main/scala/Seq/mem.scala 79:25]
    node _doForwardReg_T = eq(io_waddr, io_raddr) @[src/main/scala/Seq/mem.scala 80:39]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_wen) @[src/main/scala/Seq/mem.scala 80:52]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[src/main/scala/Seq/mem.scala 80:29]
    node _io_rdata_T = mux(doForwardReg, wdataReg, fdmem.rdata.data) @[src/main/scala/Seq/mem.scala 81:18]
    io_rdata <= _io_rdata_T @[src/main/scala/Seq/mem.scala 81:12]
    fdmem.rdata.addr <= _GEN_2
    fdmem.rdata.en <= _GEN_1
    fdmem.rdata.clk <= _GEN_3
    fdmem.MPORT.addr <= _GEN_4
    fdmem.MPORT.en <= _GEN_6
    fdmem.MPORT.clk <= _GEN_5
    fdmem.MPORT.data <= _GEN_8
    fdmem.MPORT.mask <= _GEN_7
    wdataReg <= io_wdata @[src/main/scala/Seq/mem.scala 79:25]
    doForwardReg <= _doForwardReg_T_1 @[src/main/scala/Seq/mem.scala 80:29]
