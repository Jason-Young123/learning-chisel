FIRRTL version 1.2.0
circuit mem :
  module mem :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr : UInt<10> @[src/main/scala/Seq/mem.scala 7:14]
    output io_rdata : UInt<8> @[src/main/scala/Seq/mem.scala 7:14]
    input io_wen : UInt<1> @[src/main/scala/Seq/mem.scala 7:14]
    input io_waddr : UInt<10> @[src/main/scala/Seq/mem.scala 7:14]
    input io_wdata : UInt<8> @[src/main/scala/Seq/mem.scala 7:14]

    mem mem : @[src/main/scala/Seq/mem.scala 15:24]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdata_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(UInt<1>("h1"), io_raddr) @[src/main/scala/Seq/mem.scala 17:{23,23}]
    node _io_rdata_WIRE = _GEN_0 @[src/main/scala/Seq/mem.scala 17:23]
    node _io_rdata_T = or(_io_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 17:23]
    node _io_rdata_T_1 = bits(_io_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 17:23]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 17:{23,23} 15:24]
    node _GEN_2 = validif(UInt<1>("h1"), _io_rdata_T_1) @[src/main/scala/Seq/mem.scala 17:{23,23}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[src/main/scala/Seq/mem.scala 17:{23,23}]
    node _GEN_4 = validif(io_wen, io_waddr) @[src/main/scala/Seq/mem.scala 19:15]
    node _GEN_5 = validif(io_wen, clock) @[src/main/scala/Seq/mem.scala 19:15]
    node _GEN_6 = mux(io_wen, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Seq/mem.scala 19:15 15:24]
    node _GEN_7 = validif(io_wen, UInt<1>("h1")) @[src/main/scala/Seq/mem.scala 19:15]
    node _GEN_8 = validif(io_wen, io_wdata) @[src/main/scala/Seq/mem.scala 19:15]
    io_rdata <= mem.io_rdata_MPORT.data @[src/main/scala/Seq/mem.scala 17:12]
    mem.io_rdata_MPORT.addr <= _GEN_2
    mem.io_rdata_MPORT.en <= _GEN_1
    mem.io_rdata_MPORT.clk <= _GEN_3
    mem.MPORT.addr <= _GEN_4
    mem.MPORT.en <= _GEN_6
    mem.MPORT.clk <= _GEN_5
    mem.MPORT.data <= _GEN_8
    mem.MPORT.mask <= _GEN_7
