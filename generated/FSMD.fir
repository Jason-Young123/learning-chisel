FIRRTL version 1.2.0
circuit FSMD :
  module popCountFSM :
    input clock : Clock
    input reset : Reset
    output io : { flip dinValid : UInt<1>, dinReady : UInt<1>, popCntValid : UInt<1>, flip popCntReady : UInt<1>, load : UInt<1>, flip done : UInt<1>} @[src/main/scala/FSM/FSMD.scala 42:14]

    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FSM/FSMD.scala 52:22]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
    when _T : @[src/main/scala/FSM/FSMD.scala 54:16]
      when io.dinValid : @[src/main/scala/FSM/FSMD.scala 56:24]
        state <= UInt<2>("h1") @[src/main/scala/FSM/FSMD.scala 57:15]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
      when _T_1 : @[src/main/scala/FSM/FSMD.scala 54:16]
        when io.done : @[src/main/scala/FSM/FSMD.scala 62:20]
          state <= UInt<2>("h2") @[src/main/scala/FSM/FSMD.scala 63:15]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/FSM/FSMD.scala 54:16]
        when _T_2 : @[src/main/scala/FSM/FSMD.scala 54:16]
          when io.popCntReady : @[src/main/scala/FSM/FSMD.scala 68:27]
            state <= UInt<2>("h0") @[src/main/scala/FSM/FSMD.scala 69:15]
    io.dinReady <= UInt<1>("h1") @[src/main/scala/FSM/FSMD.scala 74:15]
    node _io_popCntValid_T = eq(state, UInt<2>("h2")) @[src/main/scala/FSM/FSMD.scala 75:28]
    io.popCntValid <= _io_popCntValid_T @[src/main/scala/FSM/FSMD.scala 75:18]
    io.load <= io.dinValid @[src/main/scala/FSM/FSMD.scala 76:11]

  module popCountDataPath :
    input clock : Clock
    input reset : Reset
    output io : { flip din : UInt<8>, flip load : UInt<1>, popCnt : UInt<4>, done : UInt<1>} @[src/main/scala/FSM/FSMD.scala 8:14]

    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/FSM/FSMD.scala 15:24]
    reg popCntReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/FSM/FSMD.scala 16:26]
    reg counterReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/FSM/FSMD.scala 17:27]
    node _dataReg_T = bits(dataReg, 7, 1) @[src/main/scala/FSM/FSMD.scala 20:28]
    node _dataReg_T_1 = cat(UInt<1>("h0"), _dataReg_T) @[src/main/scala/FSM/FSMD.scala 20:18]
    dataReg <= _dataReg_T_1 @[src/main/scala/FSM/FSMD.scala 20:11]
    node _popCntReg_T = bits(dataReg, 0, 0) @[src/main/scala/FSM/FSMD.scala 21:35]
    node _popCntReg_T_1 = add(popCntReg, _popCntReg_T) @[src/main/scala/FSM/FSMD.scala 21:26]
    node _popCntReg_T_2 = tail(_popCntReg_T_1, 1) @[src/main/scala/FSM/FSMD.scala 21:26]
    popCntReg <= _popCntReg_T_2 @[src/main/scala/FSM/FSMD.scala 21:13]
    node done = eq(counterReg, UInt<1>("h0")) @[src/main/scala/FSM/FSMD.scala 23:26]
    when io.load : @[src/main/scala/FSM/FSMD.scala 25:16]
      dataReg <= io.din @[src/main/scala/FSM/FSMD.scala 26:13]
      popCntReg <= UInt<1>("h0") @[src/main/scala/FSM/FSMD.scala 27:15]
      counterReg <= UInt<4>("h8") @[src/main/scala/FSM/FSMD.scala 28:16]
    else :
      node _T = eq(done, UInt<1>("h0")) @[src/main/scala/FSM/FSMD.scala 30:10]
      when _T : @[src/main/scala/FSM/FSMD.scala 30:16]
        node _counterReg_T = sub(counterReg, UInt<1>("h1")) @[src/main/scala/FSM/FSMD.scala 31:32]
        node _counterReg_T_1 = tail(_counterReg_T, 1) @[src/main/scala/FSM/FSMD.scala 31:32]
        counterReg <= _counterReg_T_1 @[src/main/scala/FSM/FSMD.scala 31:18]
    io.popCnt <= popCntReg @[src/main/scala/FSM/FSMD.scala 35:13]
    io.done <= done @[src/main/scala/FSM/FSMD.scala 36:11]

  module FSMD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip dinValid : UInt<1>, dinReady : UInt<1>, flip din : UInt<8>, popCntValid : UInt<1>, flip popCntReady : UInt<1>, popCnt : UInt<8>} @[src/main/scala/FSM/FSMD.scala 84:14]

    inst main_fsm of popCountFSM @[src/main/scala/FSM/FSMD.scala 93:24]
    main_fsm.clock <= clock
    main_fsm.reset <= reset
    inst data_fsm of popCountDataPath @[src/main/scala/FSM/FSMD.scala 94:24]
    data_fsm.clock <= clock
    data_fsm.reset <= reset
    main_fsm.io.dinValid <= io.dinValid @[src/main/scala/FSM/FSMD.scala 97:24]
    io.dinReady <= main_fsm.io.dinReady @[src/main/scala/FSM/FSMD.scala 98:15]
    io.popCntValid <= main_fsm.io.popCntValid @[src/main/scala/FSM/FSMD.scala 99:18]
    main_fsm.io.popCntReady <= io.popCntReady @[src/main/scala/FSM/FSMD.scala 100:27]
    data_fsm.io.din <= io.din @[src/main/scala/FSM/FSMD.scala 103:19]
    io.popCnt <= data_fsm.io.popCnt @[src/main/scala/FSM/FSMD.scala 104:13]
    data_fsm.io.load <= main_fsm.io.load @[src/main/scala/FSM/FSMD.scala 107:20]
    main_fsm.io.done <= data_fsm.io.done @[src/main/scala/FSM/FSMD.scala 108:20]

