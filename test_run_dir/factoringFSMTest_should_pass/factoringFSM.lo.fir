FIRRTL version 1.2.0
circuit factoringFSM :
  module masterFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 7:14]
    output io_light : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 7:14]
    output io_timerLoad : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 7:14]
    output io_timerSelect : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 7:14]
    input io_timerDone : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 7:14]

    reg state : UInt<3>, clock with :
      reset => (UInt<1>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22]
    node _T = eq(UInt<3>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_0 = mux(io_start, UInt<3>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 25:21 17:22 25:28]
    node _T_1 = eq(UInt<3>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_1 = mux(io_timerDone, UInt<3>("h2"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22 29:{25,32}]
    node _T_2 = eq(UInt<3>("h2"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_2 = mux(io_timerDone, UInt<3>("h3"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22 33:{25,32}]
    node _T_3 = eq(UInt<3>("h3"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_3 = mux(io_timerDone, UInt<3>("h4"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22 37:{25,32}]
    node _T_4 = eq(UInt<3>("h4"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_4 = mux(io_timerDone, UInt<3>("h5"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22 41:{25,32}]
    node _T_5 = eq(UInt<3>("h5"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_5 = mux(io_timerDone, UInt<3>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 17:22 45:{25,32}]
    node _GEN_6 = mux(_T_5, _GEN_5, state) @[src/main/scala/FSM/factoringFSM.scala 23:16 17:22]
    node _GEN_7 = mux(_T_4, _GEN_4, _GEN_6) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_8 = mux(_T_3, _GEN_3, _GEN_7) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_9 = mux(_T_2, _GEN_2, _GEN_8) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_10 = mux(_T_1, _GEN_1, _GEN_9) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _GEN_11 = mux(_T, _GEN_0, _GEN_10) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    node _io_light_T = eq(state, UInt<3>("h1")) @[src/main/scala/FSM/factoringFSM.scala 50:22]
    node _io_light_T_1 = eq(state, UInt<3>("h3")) @[src/main/scala/FSM/factoringFSM.scala 50:42]
    node _io_light_T_2 = or(_io_light_T, _io_light_T_1) @[src/main/scala/FSM/factoringFSM.scala 50:33]
    node _io_light_T_3 = eq(state, UInt<3>("h5")) @[src/main/scala/FSM/factoringFSM.scala 50:62]
    node _io_light_T_4 = or(_io_light_T_2, _io_light_T_3) @[src/main/scala/FSM/factoringFSM.scala 50:53]
    node _io_timerSelect_T = eq(state, UInt<3>("h1")) @[src/main/scala/FSM/factoringFSM.scala 51:28]
    node _io_timerSelect_T_1 = eq(state, UInt<3>("h3")) @[src/main/scala/FSM/factoringFSM.scala 51:48]
    node _io_timerSelect_T_2 = or(_io_timerSelect_T, _io_timerSelect_T_1) @[src/main/scala/FSM/factoringFSM.scala 51:39]
    node _io_timerSelect_T_3 = eq(state, UInt<3>("h5")) @[src/main/scala/FSM/factoringFSM.scala 51:68]
    node _io_timerSelect_T_4 = or(_io_timerSelect_T_2, _io_timerSelect_T_3) @[src/main/scala/FSM/factoringFSM.scala 51:59]
    node _io_timerLoad_T = neq(state, UInt<3>("h0")) @[src/main/scala/FSM/factoringFSM.scala 52:26]
    io_light <= _io_light_T_4 @[src/main/scala/FSM/factoringFSM.scala 50:12]
    io_timerLoad <= _io_timerLoad_T @[src/main/scala/FSM/factoringFSM.scala 52:16]
    io_timerSelect <= _io_timerSelect_T_4 @[src/main/scala/FSM/factoringFSM.scala 51:18]
    state <= mux(reset, UInt<3>("h0"), _GEN_11) @[src/main/scala/FSM/factoringFSM.scala 17:{22,22}]

  module timerFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_timerLoad : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 60:14]
    input io_timerSelect : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 60:14]
    output io_timerDone : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 60:14]

    reg timerReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), timerReg) @[src/main/scala/FSM/factoringFSM.scala 66:25]
    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 70:22]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 73:16]
    node _timerReg_T = mux(io_timerSelect, UInt<3>("h4"), UInt<2>("h2")) @[src/main/scala/FSM/factoringFSM.scala 77:24]
    node _GEN_0 = mux(io_timerLoad, UInt<2>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 75:25 76:15 70:22]
    node _GEN_1 = mux(io_timerLoad, _timerReg_T, timerReg) @[src/main/scala/FSM/factoringFSM.scala 75:25 77:18 66:25]
    node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 73:16]
    node _T_2 = eq(timerReg, UInt<1>("h0")) @[src/main/scala/FSM/factoringFSM.scala 82:21]
    node _timerReg_T_1 = sub(timerReg, UInt<1>("h1")) @[src/main/scala/FSM/factoringFSM.scala 85:30]
    node _timerReg_T_2 = tail(_timerReg_T_1, 1) @[src/main/scala/FSM/factoringFSM.scala 85:30]
    node _GEN_2 = mux(_T_2, UInt<2>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 82:29 83:15 70:22]
    node _GEN_3 = mux(_T_2, timerReg, _timerReg_T_2) @[src/main/scala/FSM/factoringFSM.scala 66:25 82:29 85:18]
    node _GEN_4 = mux(_T_1, _GEN_2, state) @[src/main/scala/FSM/factoringFSM.scala 73:16 70:22]
    node _GEN_5 = mux(_T_1, _GEN_3, timerReg) @[src/main/scala/FSM/factoringFSM.scala 73:16 66:25]
    node _GEN_6 = mux(_T, _GEN_0, _GEN_4) @[src/main/scala/FSM/factoringFSM.scala 73:16]
    node _GEN_7 = mux(_T, _GEN_1, _GEN_5) @[src/main/scala/FSM/factoringFSM.scala 73:16]
    node _io_timerDone_T = eq(state, UInt<2>("h1")) @[src/main/scala/FSM/factoringFSM.scala 95:26]
    node _io_timerDone_T_1 = eq(timerReg, UInt<1>("h0")) @[src/main/scala/FSM/factoringFSM.scala 95:50]
    node _io_timerDone_T_2 = and(_io_timerDone_T, _io_timerDone_T_1) @[src/main/scala/FSM/factoringFSM.scala 95:37]
    io_timerDone <= _io_timerDone_T_2 @[src/main/scala/FSM/factoringFSM.scala 95:16]
    timerReg <= mux(reset, UInt<4>("h0"), _GEN_7) @[src/main/scala/FSM/factoringFSM.scala 66:{25,25}]
    state <= mux(reset, UInt<2>("h0"), _GEN_6) @[src/main/scala/FSM/factoringFSM.scala 70:{22,22}]

  module factoringFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 102:14]
    output io_light : UInt<1> @[src/main/scala/FSM/factoringFSM.scala 102:14]

    inst myMasterFSM of masterFSM @[src/main/scala/FSM/factoringFSM.scala 108:27]
    inst myTimerFSM of timerFSM @[src/main/scala/FSM/factoringFSM.scala 109:26]
    io_light <= myMasterFSM.io_light @[src/main/scala/FSM/factoringFSM.scala 113:12]
    myMasterFSM.clock <= clock
    myMasterFSM.reset <= reset
    myMasterFSM.io_start <= io_start @[src/main/scala/FSM/factoringFSM.scala 112:24]
    myMasterFSM.io_timerDone <= myTimerFSM.io_timerDone @[src/main/scala/FSM/factoringFSM.scala 118:28]
    myTimerFSM.clock <= clock
    myTimerFSM.reset <= reset
    myTimerFSM.io_timerLoad <= myMasterFSM.io_timerLoad @[src/main/scala/FSM/factoringFSM.scala 116:27]
    myTimerFSM.io_timerSelect <= myMasterFSM.io_timerSelect @[src/main/scala/FSM/factoringFSM.scala 117:29]
