FIRRTL version 1.2.0
circuit FSMD :
  module popCountFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]
    output io_dinReady : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]
    output io_popCntValid : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]
    input io_popCntReady : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]
    output io_load : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]
    input io_done : UInt<1> @[src/main/scala/FSM/FSMD.scala 42:14]

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[src/main/scala/FSM/FSMD.scala 52:22]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
    node _GEN_0 = mux(io_dinValid, UInt<2>("h1"), state) @[src/main/scala/FSM/FSMD.scala 56:24 57:15 52:22]
    node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
    node _GEN_1 = mux(io_done, UInt<2>("h2"), state) @[src/main/scala/FSM/FSMD.scala 62:20 63:15 52:22]
    node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
    node _GEN_2 = mux(io_popCntReady, UInt<2>("h0"), state) @[src/main/scala/FSM/FSMD.scala 68:27 69:15 52:22]
    node _GEN_3 = mux(_T_2, _GEN_2, state) @[src/main/scala/FSM/FSMD.scala 54:16 52:22]
    node _GEN_4 = mux(_T_1, _GEN_1, _GEN_3) @[src/main/scala/FSM/FSMD.scala 54:16]
    node _GEN_5 = mux(_T, _GEN_0, _GEN_4) @[src/main/scala/FSM/FSMD.scala 54:16]
    node _io_popCntValid_T = eq(state, UInt<2>("h2")) @[src/main/scala/FSM/FSMD.scala 75:28]
    io_dinReady <= UInt<1>("h1") @[src/main/scala/FSM/FSMD.scala 74:15]
    io_popCntValid <= _io_popCntValid_T @[src/main/scala/FSM/FSMD.scala 75:18]
    io_load <= io_dinValid @[src/main/scala/FSM/FSMD.scala 76:11]
    state <= mux(reset, UInt<2>("h0"), _GEN_5) @[src/main/scala/FSM/FSMD.scala 52:{22,22}]

  module popCountDataPath :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8> @[src/main/scala/FSM/FSMD.scala 8:14]
    input io_load : UInt<1> @[src/main/scala/FSM/FSMD.scala 8:14]
    output io_popCnt : UInt<4> @[src/main/scala/FSM/FSMD.scala 8:14]
    output io_done : UInt<1> @[src/main/scala/FSM/FSMD.scala 8:14]

    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FSM/FSMD.scala 15:24]
    reg popCntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), popCntReg) @[src/main/scala/FSM/FSMD.scala 16:26]
    reg counterReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counterReg) @[src/main/scala/FSM/FSMD.scala 17:27]
    node _dataReg_T = bits(dataReg, 7, 1) @[src/main/scala/FSM/FSMD.scala 20:28]
    node _dataReg_T_1 = cat(UInt<1>("h0"), _dataReg_T) @[src/main/scala/FSM/FSMD.scala 20:18]
    node _popCntReg_T = bits(dataReg, 0, 0) @[src/main/scala/FSM/FSMD.scala 21:35]
    node _popCntReg_T_1 = add(popCntReg, _popCntReg_T) @[src/main/scala/FSM/FSMD.scala 21:26]
    node _popCntReg_T_2 = tail(_popCntReg_T_1, 1) @[src/main/scala/FSM/FSMD.scala 21:26]
    node done = eq(counterReg, UInt<1>("h0")) @[src/main/scala/FSM/FSMD.scala 23:26]
    node _T = eq(done, UInt<1>("h0")) @[src/main/scala/FSM/FSMD.scala 30:10]
    node _counterReg_T = sub(counterReg, UInt<1>("h1")) @[src/main/scala/FSM/FSMD.scala 31:32]
    node _counterReg_T_1 = tail(_counterReg_T, 1) @[src/main/scala/FSM/FSMD.scala 31:32]
    node _GEN_0 = mux(_T, _counterReg_T_1, counterReg) @[src/main/scala/FSM/FSMD.scala 30:16 31:18 17:27]
    node _GEN_1 = mux(io_load, io_din, _dataReg_T_1) @[src/main/scala/FSM/FSMD.scala 20:11 25:16 26:13]
    node _GEN_2 = mux(io_load, UInt<1>("h0"), _popCntReg_T_2) @[src/main/scala/FSM/FSMD.scala 21:13 25:16 27:15]
    node _GEN_3 = mux(io_load, UInt<4>("h8"), _GEN_0) @[src/main/scala/FSM/FSMD.scala 25:16 28:16]
    io_popCnt <= bits(popCntReg, 3, 0) @[src/main/scala/FSM/FSMD.scala 35:13]
    io_done <= done @[src/main/scala/FSM/FSMD.scala 36:11]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_1) @[src/main/scala/FSM/FSMD.scala 15:{24,24}]
    popCntReg <= mux(reset, UInt<8>("h0"), _GEN_2) @[src/main/scala/FSM/FSMD.scala 16:{26,26}]
    counterReg <= mux(reset, UInt<4>("h0"), _GEN_3) @[src/main/scala/FSM/FSMD.scala 17:{27,27}]

  module FSMD :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1> @[src/main/scala/FSM/FSMD.scala 84:14]
    output io_dinReady : UInt<1> @[src/main/scala/FSM/FSMD.scala 84:14]
    input io_din : UInt<8> @[src/main/scala/FSM/FSMD.scala 84:14]
    output io_popCntValid : UInt<1> @[src/main/scala/FSM/FSMD.scala 84:14]
    input io_popCntReady : UInt<1> @[src/main/scala/FSM/FSMD.scala 84:14]
    output io_popCnt : UInt<8> @[src/main/scala/FSM/FSMD.scala 84:14]

    inst main_fsm of popCountFSM @[src/main/scala/FSM/FSMD.scala 93:24]
    inst data_fsm of popCountDataPath @[src/main/scala/FSM/FSMD.scala 94:24]
    io_dinReady <= main_fsm.io_dinReady @[src/main/scala/FSM/FSMD.scala 98:15]
    io_popCntValid <= main_fsm.io_popCntValid @[src/main/scala/FSM/FSMD.scala 99:18]
    io_popCnt <= pad(data_fsm.io_popCnt, 8) @[src/main/scala/FSM/FSMD.scala 104:13]
    main_fsm.clock <= clock
    main_fsm.reset <= reset
    main_fsm.io_dinValid <= io_dinValid @[src/main/scala/FSM/FSMD.scala 97:24]
    main_fsm.io_popCntReady <= io_popCntReady @[src/main/scala/FSM/FSMD.scala 100:27]
    main_fsm.io_done <= data_fsm.io_done @[src/main/scala/FSM/FSMD.scala 108:20]
    data_fsm.clock <= clock
    data_fsm.reset <= reset
    data_fsm.io_din <= io_din @[src/main/scala/FSM/FSMD.scala 103:19]
    data_fsm.io_load <= main_fsm.io_load @[src/main/scala/FSM/FSMD.scala 107:20]
