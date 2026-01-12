FIRRTL version 1.2.0
circuit factoringFSM :
  module masterFSM :
    input clock : Clock
    input reset : Reset
    output io : { flip start : UInt<1>, light : UInt<1>, timerLoad : UInt<1>, timerSelect : UInt<1>, flip timerDone : UInt<1>} @[src/main/scala/FSM/factoringFSM.scala 7:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[src/main/scala/FSM/factoringFSM.scala 17:22]
    node _T = eq(UInt<3>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
    when _T : @[src/main/scala/FSM/factoringFSM.scala 23:16]
      when io.start : @[src/main/scala/FSM/factoringFSM.scala 25:21]
        state <= UInt<3>("h1") @[src/main/scala/FSM/factoringFSM.scala 25:28]
    else :
      node _T_1 = eq(UInt<3>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
      when _T_1 : @[src/main/scala/FSM/factoringFSM.scala 23:16]
        when io.timerDone : @[src/main/scala/FSM/factoringFSM.scala 29:25]
          state <= UInt<3>("h2") @[src/main/scala/FSM/factoringFSM.scala 29:32]
      else :
        node _T_2 = eq(UInt<3>("h2"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
        when _T_2 : @[src/main/scala/FSM/factoringFSM.scala 23:16]
          when io.timerDone : @[src/main/scala/FSM/factoringFSM.scala 33:25]
            state <= UInt<3>("h3") @[src/main/scala/FSM/factoringFSM.scala 33:32]
        else :
          node _T_3 = eq(UInt<3>("h3"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
          when _T_3 : @[src/main/scala/FSM/factoringFSM.scala 23:16]
            when io.timerDone : @[src/main/scala/FSM/factoringFSM.scala 37:25]
              state <= UInt<3>("h4") @[src/main/scala/FSM/factoringFSM.scala 37:32]
          else :
            node _T_4 = eq(UInt<3>("h4"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
            when _T_4 : @[src/main/scala/FSM/factoringFSM.scala 23:16]
              when io.timerDone : @[src/main/scala/FSM/factoringFSM.scala 41:25]
                state <= UInt<3>("h5") @[src/main/scala/FSM/factoringFSM.scala 41:32]
            else :
              node _T_5 = eq(UInt<3>("h5"), state) @[src/main/scala/FSM/factoringFSM.scala 23:16]
              when _T_5 : @[src/main/scala/FSM/factoringFSM.scala 23:16]
                when io.timerDone : @[src/main/scala/FSM/factoringFSM.scala 45:25]
                  state <= UInt<3>("h0") @[src/main/scala/FSM/factoringFSM.scala 45:32]
    node _io_light_T = eq(state, UInt<3>("h1")) @[src/main/scala/FSM/factoringFSM.scala 50:22]
    node _io_light_T_1 = eq(state, UInt<3>("h3")) @[src/main/scala/FSM/factoringFSM.scala 50:42]
    node _io_light_T_2 = or(_io_light_T, _io_light_T_1) @[src/main/scala/FSM/factoringFSM.scala 50:33]
    node _io_light_T_3 = eq(state, UInt<3>("h5")) @[src/main/scala/FSM/factoringFSM.scala 50:62]
    node _io_light_T_4 = or(_io_light_T_2, _io_light_T_3) @[src/main/scala/FSM/factoringFSM.scala 50:53]
    io.light <= _io_light_T_4 @[src/main/scala/FSM/factoringFSM.scala 50:12]
    node _io_timerSelect_T = eq(state, UInt<3>("h1")) @[src/main/scala/FSM/factoringFSM.scala 51:28]
    node _io_timerSelect_T_1 = eq(state, UInt<3>("h3")) @[src/main/scala/FSM/factoringFSM.scala 51:48]
    node _io_timerSelect_T_2 = or(_io_timerSelect_T, _io_timerSelect_T_1) @[src/main/scala/FSM/factoringFSM.scala 51:39]
    node _io_timerSelect_T_3 = eq(state, UInt<3>("h5")) @[src/main/scala/FSM/factoringFSM.scala 51:68]
    node _io_timerSelect_T_4 = or(_io_timerSelect_T_2, _io_timerSelect_T_3) @[src/main/scala/FSM/factoringFSM.scala 51:59]
    io.timerSelect <= _io_timerSelect_T_4 @[src/main/scala/FSM/factoringFSM.scala 51:18]
    node _io_timerLoad_T = neq(state, UInt<3>("h0")) @[src/main/scala/FSM/factoringFSM.scala 52:26]
    io.timerLoad <= _io_timerLoad_T @[src/main/scala/FSM/factoringFSM.scala 52:16]

  module timerFSM :
    input clock : Clock
    input reset : Reset
    output io : { flip timerLoad : UInt<1>, flip timerSelect : UInt<1>, timerDone : UInt<1>} @[src/main/scala/FSM/factoringFSM.scala 60:14]

    reg timerReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/FSM/factoringFSM.scala 66:25]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FSM/factoringFSM.scala 70:22]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/FSM/factoringFSM.scala 73:16]
    when _T : @[src/main/scala/FSM/factoringFSM.scala 73:16]
      when io.timerLoad : @[src/main/scala/FSM/factoringFSM.scala 75:25]
        state <= UInt<2>("h1") @[src/main/scala/FSM/factoringFSM.scala 76:15]
        node _timerReg_T = mux(io.timerSelect, UInt<2>("h2"), UInt<1>("h0")) @[src/main/scala/FSM/factoringFSM.scala 77:24]
        timerReg <= _timerReg_T @[src/main/scala/FSM/factoringFSM.scala 77:18]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/FSM/factoringFSM.scala 73:16]
      when _T_1 : @[src/main/scala/FSM/factoringFSM.scala 73:16]
        node _T_2 = eq(timerReg, UInt<1>("h0")) @[src/main/scala/FSM/factoringFSM.scala 82:21]
        when _T_2 : @[src/main/scala/FSM/factoringFSM.scala 82:29]
          state <= UInt<2>("h0") @[src/main/scala/FSM/factoringFSM.scala 83:15]
        else :
          node _timerReg_T_1 = sub(timerReg, UInt<1>("h1")) @[src/main/scala/FSM/factoringFSM.scala 85:30]
          node _timerReg_T_2 = tail(_timerReg_T_1, 1) @[src/main/scala/FSM/factoringFSM.scala 85:30]
          timerReg <= _timerReg_T_2 @[src/main/scala/FSM/factoringFSM.scala 85:18]
    node _io_timerDone_T = eq(state, UInt<2>("h1")) @[src/main/scala/FSM/factoringFSM.scala 95:26]
    node _io_timerDone_T_1 = eq(timerReg, UInt<1>("h0")) @[src/main/scala/FSM/factoringFSM.scala 95:50]
    node _io_timerDone_T_2 = and(_io_timerDone_T, _io_timerDone_T_1) @[src/main/scala/FSM/factoringFSM.scala 95:37]
    io.timerDone <= _io_timerDone_T_2 @[src/main/scala/FSM/factoringFSM.scala 95:16]

  module factoringFSM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip start : UInt<1>, light : UInt<1>} @[src/main/scala/FSM/factoringFSM.scala 102:14]

    inst myMasterFSM of masterFSM @[src/main/scala/FSM/factoringFSM.scala 108:27]
    myMasterFSM.clock <= clock
    myMasterFSM.reset <= reset
    inst myTimerFSM of timerFSM @[src/main/scala/FSM/factoringFSM.scala 109:26]
    myTimerFSM.clock <= clock
    myTimerFSM.reset <= reset
    myMasterFSM.io.start <= io.start @[src/main/scala/FSM/factoringFSM.scala 112:24]
    io.light <= myMasterFSM.io.light @[src/main/scala/FSM/factoringFSM.scala 113:12]
    myTimerFSM.io.timerLoad <= myMasterFSM.io.timerLoad @[src/main/scala/FSM/factoringFSM.scala 116:27]
    myTimerFSM.io.timerSelect <= myMasterFSM.io.timerSelect @[src/main/scala/FSM/factoringFSM.scala 117:29]
    myMasterFSM.io.timerDone <= myTimerFSM.io.timerDone @[src/main/scala/FSM/factoringFSM.scala 118:28]

