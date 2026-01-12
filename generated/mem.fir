FIRRTL version 1.2.0
circuit mem :
  module mem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip raddr : UInt<10>, rdata : UInt<8>, flip wen : UInt<1>, flip waddr : UInt<10>, flip wdata : UInt<8>} @[src/main/scala/Seq/mem.scala 7:14]

    smem mem : UInt<8> [1024] @[src/main/scala/Seq/mem.scala 15:24]
    wire _io_rdata_WIRE : UInt @[src/main/scala/Seq/mem.scala 17:23]
    _io_rdata_WIRE is invalid @[src/main/scala/Seq/mem.scala 17:23]
    when UInt<1>("h1") : @[src/main/scala/Seq/mem.scala 17:23]
      _io_rdata_WIRE <= io.raddr @[src/main/scala/Seq/mem.scala 17:23]
      node _io_rdata_T = or(_io_rdata_WIRE, UInt<10>("h0")) @[src/main/scala/Seq/mem.scala 17:23]
      node _io_rdata_T_1 = bits(_io_rdata_T, 9, 0) @[src/main/scala/Seq/mem.scala 17:23]
      read mport io_rdata_MPORT = mem[_io_rdata_T_1], clock @[src/main/scala/Seq/mem.scala 17:23]
    io.rdata <= io_rdata_MPORT @[src/main/scala/Seq/mem.scala 17:12]
    when io.wen : @[src/main/scala/Seq/mem.scala 19:15]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.wdata


