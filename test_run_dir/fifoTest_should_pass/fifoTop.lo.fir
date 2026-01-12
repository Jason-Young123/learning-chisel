FIRRTL version 1.2.0
circuit fifoTop :
  module Buffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 53:16]
    input io_enq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 53:16]
    input io_enq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 53:16]
    input io_deq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 53:16]
    output io_deq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 53:16]
    output io_deq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    node _GEN_0 = mux(io_enq_valid, UInt<1>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 60:25 61:18 56:27]
    node _GEN_1 = mux(io_enq_valid, io_enq_bits, dataReg) @[src/main/scala/FIFO/fifo.scala 60:25 62:17 57:22]
    node _GEN_2 = mux(io_deq_ready, UInt<1>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 65:25 66:18 56:27]
    node _GEN_3 = mux(_T, _GEN_0, _GEN_2) @[src/main/scala/FIFO/fifo.scala 59:29]
    node _GEN_4 = mux(_T, _GEN_1, dataReg) @[src/main/scala/FIFO/fifo.scala 57:22 59:29]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io_enq_ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    io_deq_valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io_deq_bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_3) @[src/main/scala/FIFO/fifo.scala 56:{27,27}]
    dataReg <= _GEN_4

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_enq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_enq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_deq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    output io_deq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    output io_deq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 40:14]

    inst Buffer of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_1 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_2 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_3 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_4 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_5 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_6 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_7 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_8 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_9 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_10 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_11 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_12 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_13 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_14 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    inst Buffer_15 of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    io_enq_ready <= Buffer.io_enq_ready @[src/main/scala/FIFO/fifo.scala 80:21]
    io_deq_valid <= Buffer_15.io_deq_valid @[src/main/scala/FIFO/fifo.scala 81:10]
    io_deq_bits <= Buffer_15.io_deq_bits @[src/main/scala/FIFO/fifo.scala 81:10]
    Buffer.clock <= clock
    Buffer.reset <= reset
    Buffer.io_enq_valid <= io_enq_valid @[src/main/scala/FIFO/fifo.scala 80:21]
    Buffer.io_enq_bits <= io_enq_bits @[src/main/scala/FIFO/fifo.scala 80:21]
    Buffer.io_deq_ready <= Buffer_1.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    Buffer_1.io_enq_valid <= Buffer.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_1.io_enq_bits <= Buffer.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_1.io_deq_ready <= Buffer_2.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    Buffer_2.io_enq_valid <= Buffer_1.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_2.io_enq_bits <= Buffer_1.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_2.io_deq_ready <= Buffer_3.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    Buffer_3.io_enq_valid <= Buffer_2.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_3.io_enq_bits <= Buffer_2.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_3.io_deq_ready <= Buffer_4.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_4.clock <= clock
    Buffer_4.reset <= reset
    Buffer_4.io_enq_valid <= Buffer_3.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_4.io_enq_bits <= Buffer_3.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_4.io_deq_ready <= Buffer_5.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_5.clock <= clock
    Buffer_5.reset <= reset
    Buffer_5.io_enq_valid <= Buffer_4.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_5.io_enq_bits <= Buffer_4.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_5.io_deq_ready <= Buffer_6.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_6.clock <= clock
    Buffer_6.reset <= reset
    Buffer_6.io_enq_valid <= Buffer_5.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_6.io_enq_bits <= Buffer_5.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_6.io_deq_ready <= Buffer_7.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_7.clock <= clock
    Buffer_7.reset <= reset
    Buffer_7.io_enq_valid <= Buffer_6.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_7.io_enq_bits <= Buffer_6.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_7.io_deq_ready <= Buffer_8.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_8.clock <= clock
    Buffer_8.reset <= reset
    Buffer_8.io_enq_valid <= Buffer_7.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_8.io_enq_bits <= Buffer_7.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_8.io_deq_ready <= Buffer_9.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_9.clock <= clock
    Buffer_9.reset <= reset
    Buffer_9.io_enq_valid <= Buffer_8.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_9.io_enq_bits <= Buffer_8.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_9.io_deq_ready <= Buffer_10.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_10.clock <= clock
    Buffer_10.reset <= reset
    Buffer_10.io_enq_valid <= Buffer_9.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_10.io_enq_bits <= Buffer_9.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_10.io_deq_ready <= Buffer_11.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_11.clock <= clock
    Buffer_11.reset <= reset
    Buffer_11.io_enq_valid <= Buffer_10.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_11.io_enq_bits <= Buffer_10.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_11.io_deq_ready <= Buffer_12.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_12.clock <= clock
    Buffer_12.reset <= reset
    Buffer_12.io_enq_valid <= Buffer_11.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_12.io_enq_bits <= Buffer_11.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_12.io_deq_ready <= Buffer_13.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_13.clock <= clock
    Buffer_13.reset <= reset
    Buffer_13.io_enq_valid <= Buffer_12.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_13.io_enq_bits <= Buffer_12.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_13.io_deq_ready <= Buffer_14.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_14.clock <= clock
    Buffer_14.reset <= reset
    Buffer_14.io_enq_valid <= Buffer_13.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_14.io_enq_bits <= Buffer_13.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_14.io_deq_ready <= Buffer_15.io_enq_ready @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_15.clock <= clock
    Buffer_15.reset <= reset
    Buffer_15.io_enq_valid <= Buffer_14.io_deq_valid @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_15.io_enq_bits <= Buffer_14.io_deq_bits @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_15.io_deq_ready <= io_deq_ready @[src/main/scala/FIFO/fifo.scala 81:10]

  module DoubleBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 92:16]
    input io_enq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 92:16]
    input io_enq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 92:16]
    input io_deq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 92:16]
    output io_deq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 92:16]
    output io_deq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_0 = mux(io_enq_valid, UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 101:27 102:20 95:27]
    node _GEN_1 = mux(io_enq_valid, io_enq_bits, dataReg) @[src/main/scala/FIFO/fifo.scala 101:27 103:19 96:22]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _T_2 = eq(io_enq_valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
    node _T_3 = and(io_deq_ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
    node _GEN_2 = mux(_T_3, UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 108:44 109:20 95:27]
    node _T_4 = and(io_deq_ready, io_enq_valid) @[src/main/scala/FIFO/fifo.scala 111:27]
    node _GEN_3 = mux(_T_4, UInt<2>("h1"), _GEN_2) @[src/main/scala/FIFO/fifo.scala 111:43 112:20]
    node _GEN_4 = mux(_T_4, io_enq_bits, dataReg) @[src/main/scala/FIFO/fifo.scala 111:43 113:19 96:22]
    node _T_5 = eq(io_deq_ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
    node _T_6 = and(_T_5, io_enq_valid) @[src/main/scala/FIFO/fifo.scala 115:28]
    node _GEN_5 = mux(_T_6, UInt<2>("h2"), _GEN_3) @[src/main/scala/FIFO/fifo.scala 115:44 116:20]
    node _GEN_6 = mux(_T_6, io_enq_bits, shadowReg) @[src/main/scala/FIFO/fifo.scala 115:44 117:21 97:24]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_7 = mux(io_deq_ready, shadowReg, dataReg) @[src/main/scala/FIFO/fifo.scala 122:27 123:19 96:22]
    node _GEN_8 = mux(io_deq_ready, UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 122:27 124:20 95:27]
    node _GEN_9 = mux(_T_7, _GEN_7, dataReg) @[src/main/scala/FIFO/fifo.scala 99:21 96:22]
    node _GEN_10 = mux(_T_7, _GEN_8, stateReg) @[src/main/scala/FIFO/fifo.scala 99:21 95:27]
    node _GEN_11 = mux(_T_1, _GEN_5, _GEN_10) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_12 = mux(_T_1, _GEN_4, _GEN_9) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_13 = mux(_T_1, _GEN_6, shadowReg) @[src/main/scala/FIFO/fifo.scala 99:21 97:24]
    node _GEN_14 = mux(_T, _GEN_0, _GEN_11) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_15 = mux(_T, _GEN_1, _GEN_12) @[src/main/scala/FIFO/fifo.scala 99:21]
    node _GEN_16 = mux(_T, shadowReg, _GEN_13) @[src/main/scala/FIFO/fifo.scala 99:21 97:24]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io_enq_ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    io_deq_valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io_deq_bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_14) @[src/main/scala/FIFO/fifo.scala 95:{27,27}]
    dataReg <= _GEN_15
    shadowReg <= _GEN_16

  module DoubleBufferFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_enq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_enq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 40:14]
    input io_deq_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    output io_deq_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 40:14]
    output io_deq_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 40:14]

    inst DoubleBuffer of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_1 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_2 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_3 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_4 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_5 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_6 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    inst DoubleBuffer_7 of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    io_enq_ready <= DoubleBuffer.io_enq_ready @[src/main/scala/FIFO/fifo.scala 139:21]
    io_deq_valid <= DoubleBuffer_7.io_deq_valid @[src/main/scala/FIFO/fifo.scala 140:10]
    io_deq_bits <= DoubleBuffer_7.io_deq_bits @[src/main/scala/FIFO/fifo.scala 140:10]
    DoubleBuffer.clock <= clock
    DoubleBuffer.reset <= reset
    DoubleBuffer.io_enq_valid <= io_enq_valid @[src/main/scala/FIFO/fifo.scala 139:21]
    DoubleBuffer.io_enq_bits <= io_enq_bits @[src/main/scala/FIFO/fifo.scala 139:21]
    DoubleBuffer.io_deq_ready <= DoubleBuffer_1.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_1.clock <= clock
    DoubleBuffer_1.reset <= reset
    DoubleBuffer_1.io_enq_valid <= DoubleBuffer.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_1.io_enq_bits <= DoubleBuffer.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_1.io_deq_ready <= DoubleBuffer_2.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_2.clock <= clock
    DoubleBuffer_2.reset <= reset
    DoubleBuffer_2.io_enq_valid <= DoubleBuffer_1.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_2.io_enq_bits <= DoubleBuffer_1.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_2.io_deq_ready <= DoubleBuffer_3.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_3.clock <= clock
    DoubleBuffer_3.reset <= reset
    DoubleBuffer_3.io_enq_valid <= DoubleBuffer_2.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_3.io_enq_bits <= DoubleBuffer_2.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_3.io_deq_ready <= DoubleBuffer_4.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_4.clock <= clock
    DoubleBuffer_4.reset <= reset
    DoubleBuffer_4.io_enq_valid <= DoubleBuffer_3.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_4.io_enq_bits <= DoubleBuffer_3.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_4.io_deq_ready <= DoubleBuffer_5.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_5.clock <= clock
    DoubleBuffer_5.reset <= reset
    DoubleBuffer_5.io_enq_valid <= DoubleBuffer_4.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_5.io_enq_bits <= DoubleBuffer_4.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_5.io_deq_ready <= DoubleBuffer_6.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_6.clock <= clock
    DoubleBuffer_6.reset <= reset
    DoubleBuffer_6.io_enq_valid <= DoubleBuffer_5.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_6.io_enq_bits <= DoubleBuffer_5.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_6.io_deq_ready <= DoubleBuffer_7.io_enq_ready @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_7.clock <= clock
    DoubleBuffer_7.reset <= reset
    DoubleBuffer_7.io_enq_valid <= DoubleBuffer_6.io_deq_valid @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_7.io_enq_bits <= DoubleBuffer_6.io_deq_bits @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_7.io_deq_ready <= io_deq_ready @[src/main/scala/FIFO/fifo.scala 140:10]

  module fifoTop :
    input clock : Clock
    input reset : UInt<1>
    output io_enq1_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_enq1_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_enq1_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 148:14]
    output io_enq2_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_enq2_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_enq2_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_deq1_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    output io_deq1_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    output io_deq1_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 148:14]
    input io_deq2_ready : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    output io_deq2_valid : UInt<1> @[src/main/scala/FIFO/fifo.scala 148:14]
    output io_deq2_bits : UInt<8> @[src/main/scala/FIFO/fifo.scala 148:14]

    inst myfifo1 of BubbleFifo @[src/main/scala/FIFO/fifo.scala 155:23]
    inst myfifo2 of DoubleBufferFifo @[src/main/scala/FIFO/fifo.scala 156:23]
    io_enq1_ready <= myfifo1.io_enq_ready @[src/main/scala/FIFO/fifo.scala 158:18]
    io_enq2_ready <= myfifo2.io_enq_ready @[src/main/scala/FIFO/fifo.scala 159:18]
    io_deq1_valid <= myfifo1.io_deq_valid @[src/main/scala/FIFO/fifo.scala 160:11]
    io_deq1_bits <= myfifo1.io_deq_bits @[src/main/scala/FIFO/fifo.scala 160:11]
    io_deq2_valid <= myfifo2.io_deq_valid @[src/main/scala/FIFO/fifo.scala 161:11]
    io_deq2_bits <= myfifo2.io_deq_bits @[src/main/scala/FIFO/fifo.scala 161:11]
    myfifo1.clock <= clock
    myfifo1.reset <= reset
    myfifo1.io_enq_valid <= io_enq1_valid @[src/main/scala/FIFO/fifo.scala 158:18]
    myfifo1.io_enq_bits <= io_enq1_bits @[src/main/scala/FIFO/fifo.scala 158:18]
    myfifo1.io_deq_ready <= io_deq1_ready @[src/main/scala/FIFO/fifo.scala 160:11]
    myfifo2.clock <= clock
    myfifo2.reset <= reset
    myfifo2.io_enq_valid <= io_enq2_valid @[src/main/scala/FIFO/fifo.scala 159:18]
    myfifo2.io_enq_bits <= io_enq2_bits @[src/main/scala/FIFO/fifo.scala 159:18]
    myfifo2.io_deq_ready <= io_deq2_ready @[src/main/scala/FIFO/fifo.scala 161:11]
