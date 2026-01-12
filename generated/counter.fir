FIRRTL version 1.2.0
circuit counter :
  module counter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, flip dir : UInt<1>, out : UInt<4>, out1 : UInt<4>, out2 : UInt<4>, pwm_clk : UInt<1>, mod_sig : UInt<1>} @[src/main/scala/Seq/counter.scala 27:14]

    reg cntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/counter.scala 38:23]
    when io.en : @[src/main/scala/Seq/counter.scala 39:14]
      when io.dir : @[src/main/scala/Seq/counter.scala 40:17]
        node _cntReg_T = eq(cntReg, UInt<3>("h7")) @[src/main/scala/Seq/counter.scala 41:28]
        node _cntReg_T_1 = add(cntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 41:49]
        node _cntReg_T_2 = tail(_cntReg_T_1, 1) @[src/main/scala/Seq/counter.scala 41:49]
        node _cntReg_T_3 = mux(_cntReg_T, UInt<1>("h0"), _cntReg_T_2) @[src/main/scala/Seq/counter.scala 41:20]
        cntReg <= _cntReg_T_3 @[src/main/scala/Seq/counter.scala 41:14]
      else :
        node _cntReg_T_4 = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Seq/counter.scala 43:28]
        node _cntReg_T_5 = sub(cntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 43:49]
        node _cntReg_T_6 = tail(_cntReg_T_5, 1) @[src/main/scala/Seq/counter.scala 43:49]
        node _cntReg_T_7 = mux(_cntReg_T_4, UInt<3>("h7"), _cntReg_T_6) @[src/main/scala/Seq/counter.scala 43:20]
        cntReg <= _cntReg_T_7 @[src/main/scala/Seq/counter.scala 43:14]
    io.out <= cntReg @[src/main/scala/Seq/counter.scala 46:10]
    reg upcnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/counter.scala 8:25]
    node _upcnt_cntReg_T = eq(upcnt, UInt<4>("hb")) @[src/main/scala/Seq/counter.scala 9:26]
    node _upcnt_cntReg_T_1 = add(upcnt, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 9:45]
    node _upcnt_cntReg_T_2 = tail(_upcnt_cntReg_T_1, 1) @[src/main/scala/Seq/counter.scala 9:45]
    node _upcnt_cntReg_T_3 = mux(_upcnt_cntReg_T, UInt<1>("h0"), _upcnt_cntReg_T_2) @[src/main/scala/Seq/counter.scala 9:18]
    upcnt <= _upcnt_cntReg_T_3 @[src/main/scala/Seq/counter.scala 9:12]
    io.out1 <= upcnt @[src/main/scala/Seq/counter.scala 50:11]
    reg tickCntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/counter.scala 54:27]
    node tick = eq(tickCntReg, UInt<4>("ha")) @[src/main/scala/Seq/counter.scala 55:26]
    node _tickCntReg_T = add(tickCntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 56:28]
    node _tickCntReg_T_1 = tail(_tickCntReg_T, 1) @[src/main/scala/Seq/counter.scala 56:28]
    tickCntReg <= _tickCntReg_T_1 @[src/main/scala/Seq/counter.scala 56:14]
    when tick : @[src/main/scala/Seq/counter.scala 57:15]
      tickCntReg <= UInt<1>("h0") @[src/main/scala/Seq/counter.scala 58:16]
    reg lowFrqCntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/counter.scala 61:29]
    when tick : @[src/main/scala/Seq/counter.scala 62:15]
      node _lowFrqCntReg_T = add(lowFrqCntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 63:34]
      node _lowFrqCntReg_T_1 = tail(_lowFrqCntReg_T, 1) @[src/main/scala/Seq/counter.scala 63:34]
      lowFrqCntReg <= _lowFrqCntReg_T_1 @[src/main/scala/Seq/counter.scala 63:18]
    io.out2 <= lowFrqCntReg @[src/main/scala/Seq/counter.scala 65:11]
    reg dout_cntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/counter.scala 18:25]
    node _dout_cntReg_T = eq(dout_cntReg, UInt<4>("ha")) @[src/main/scala/Seq/counter.scala 19:26]
    node _dout_cntReg_T_1 = add(dout_cntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 19:52]
    node _dout_cntReg_T_2 = tail(_dout_cntReg_T_1, 1) @[src/main/scala/Seq/counter.scala 19:52]
    node _dout_cntReg_T_3 = mux(_dout_cntReg_T, UInt<1>("h0"), _dout_cntReg_T_2) @[src/main/scala/Seq/counter.scala 19:18]
    dout_cntReg <= _dout_cntReg_T_3 @[src/main/scala/Seq/counter.scala 19:12]
    node dout = gt(UInt<2>("h3"), dout_cntReg) @[src/main/scala/Seq/counter.scala 20:14]
    io.pwm_clk <= dout @[src/main/scala/Seq/counter.scala 69:14]
    node MAX = div(UInt<17>("h186a0"), UInt<7>("h64")) @[src/main/scala/Seq/counter.scala 74:17]
    reg modulationReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/Seq/counter.scala 75:30]
    reg upReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 76:22]
    node _T = lt(modulationReg, UInt<17>("h186a0")) @[src/main/scala/Seq/counter.scala 79:23]
    node _T_1 = and(_T, upReg) @[src/main/scala/Seq/counter.scala 79:30]
    when _T_1 : @[src/main/scala/Seq/counter.scala 79:39]
      node _modulationReg_T = add(modulationReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 80:36]
      node _modulationReg_T_1 = tail(_modulationReg_T, 1) @[src/main/scala/Seq/counter.scala 80:36]
      modulationReg <= _modulationReg_T_1 @[src/main/scala/Seq/counter.scala 80:19]
    else :
      node _T_2 = eq(modulationReg, UInt<17>("h186a0")) @[src/main/scala/Seq/counter.scala 81:30]
      node _T_3 = and(_T_2, upReg) @[src/main/scala/Seq/counter.scala 81:39]
      when _T_3 : @[src/main/scala/Seq/counter.scala 81:48]
        upReg <= UInt<1>("h0") @[src/main/scala/Seq/counter.scala 82:11]
      else :
        node _T_4 = gt(modulationReg, UInt<1>("h0")) @[src/main/scala/Seq/counter.scala 83:30]
        node _T_5 = eq(upReg, UInt<1>("h0")) @[src/main/scala/Seq/counter.scala 83:39]
        node _T_6 = and(_T_4, _T_5) @[src/main/scala/Seq/counter.scala 83:36]
        when _T_6 : @[src/main/scala/Seq/counter.scala 83:46]
          node _modulationReg_T_2 = sub(modulationReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 84:36]
          node _modulationReg_T_3 = tail(_modulationReg_T_2, 1) @[src/main/scala/Seq/counter.scala 84:36]
          modulationReg <= _modulationReg_T_3 @[src/main/scala/Seq/counter.scala 84:19]
        else :
          upReg <= UInt<1>("h1") @[src/main/scala/Seq/counter.scala 86:11]
    node _sig_T = div(modulationReg, UInt<7>("h64")) @[src/main/scala/Seq/counter.scala 88:46]
    reg sig_cntReg : UInt<17>, clock with :
      reset => (reset, UInt<17>("h0")) @[src/main/scala/Seq/counter.scala 18:25]
    node _sig_cntReg_T = eq(sig_cntReg, MAX) @[src/main/scala/Seq/counter.scala 19:26]
    node _sig_cntReg_T_1 = add(sig_cntReg, UInt<1>("h1")) @[src/main/scala/Seq/counter.scala 19:52]
    node _sig_cntReg_T_2 = tail(_sig_cntReg_T_1, 1) @[src/main/scala/Seq/counter.scala 19:52]
    node _sig_cntReg_T_3 = mux(_sig_cntReg_T, UInt<1>("h0"), _sig_cntReg_T_2) @[src/main/scala/Seq/counter.scala 19:18]
    sig_cntReg <= _sig_cntReg_T_3 @[src/main/scala/Seq/counter.scala 19:12]
    node sig = gt(_sig_T, sig_cntReg) @[src/main/scala/Seq/counter.scala 20:14]
    io.mod_sig <= sig @[src/main/scala/Seq/counter.scala 89:14]

