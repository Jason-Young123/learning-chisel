FIRRTL version 1.2.0
circuit tricks :
  module tricks :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip btn_async : UInt<1>, btn_out : UInt<1>, cnt : UInt<4>} @[src/main/scala/Seq/tricks.scala 34:14]

    reg btn_sync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btn_sync_REG) @[src/main/scala/Seq/tricks.scala 7:44]
    btn_sync_REG <= io.btn_async @[src/main/scala/Seq/tricks.scala 7:44]
    reg btn_sync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btn_sync) @[src/main/scala/Seq/tricks.scala 7:36]
    btn_sync <= btn_sync_REG @[src/main/scala/Seq/tricks.scala 7:36]
    reg tick_cntReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/tricks.scala 11:25]
    node tick = eq(tick_cntReg, UInt<4>("ha")) @[src/main/scala/Seq/tricks.scala 12:24]
    node _tick_cntReg_T = add(tick_cntReg, UInt<1>("h1")) @[src/main/scala/Seq/tricks.scala 13:37]
    node _tick_cntReg_T_1 = tail(_tick_cntReg_T, 1) @[src/main/scala/Seq/tricks.scala 13:37]
    node _tick_cntReg_T_2 = mux(tick, UInt<1>("h0"), _tick_cntReg_T_1) @[src/main/scala/Seq/tricks.scala 13:18]
    tick_cntReg <= _tick_cntReg_T_2 @[src/main/scala/Seq/tricks.scala 13:12]
    reg btn_debounce : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btn_debounce) @[src/main/scala/Seq/tricks.scala 47:25]
    when tick : @[src/main/scala/Seq/tricks.scala 48:13]
      btn_debounce <= btn_sync @[src/main/scala/Seq/tricks.scala 49:18]
    reg btn_filtered_shiftReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[src/main/scala/Seq/tricks.scala 19:27]
    when tick : @[src/main/scala/Seq/tricks.scala 20:15]
      node _btn_filtered_shiftReg_T = bits(btn_filtered_shiftReg, 1, 0) @[src/main/scala/Seq/tricks.scala 21:31]
      node _btn_filtered_shiftReg_T_1 = cat(_btn_filtered_shiftReg_T, btn_debounce) @[src/main/scala/Seq/tricks.scala 21:22]
      btn_filtered_shiftReg <= _btn_filtered_shiftReg_T_1 @[src/main/scala/Seq/tricks.scala 21:16]
    node _btn_filtered_T = bits(btn_filtered_shiftReg, 2, 2) @[src/main/scala/Seq/tricks.scala 23:14]
    node _btn_filtered_T_1 = bits(btn_filtered_shiftReg, 1, 1) @[src/main/scala/Seq/tricks.scala 23:28]
    node _btn_filtered_T_2 = and(_btn_filtered_T, _btn_filtered_T_1) @[src/main/scala/Seq/tricks.scala 23:18]
    node _btn_filtered_T_3 = bits(btn_filtered_shiftReg, 2, 2) @[src/main/scala/Seq/tricks.scala 23:44]
    node _btn_filtered_T_4 = bits(btn_filtered_shiftReg, 0, 0) @[src/main/scala/Seq/tricks.scala 23:58]
    node _btn_filtered_T_5 = and(_btn_filtered_T_3, _btn_filtered_T_4) @[src/main/scala/Seq/tricks.scala 23:48]
    node _btn_filtered_T_6 = or(_btn_filtered_T_2, _btn_filtered_T_5) @[src/main/scala/Seq/tricks.scala 23:33]
    node _btn_filtered_T_7 = bits(btn_filtered_shiftReg, 1, 1) @[src/main/scala/Seq/tricks.scala 23:74]
    node _btn_filtered_T_8 = bits(btn_filtered_shiftReg, 1, 1) @[src/main/scala/Seq/tricks.scala 23:88]
    node _btn_filtered_T_9 = and(_btn_filtered_T_7, _btn_filtered_T_8) @[src/main/scala/Seq/tricks.scala 23:78]
    node btn_filtered = or(_btn_filtered_T_6, _btn_filtered_T_9) @[src/main/scala/Seq/tricks.scala 23:63]
    io.btn_out <= btn_filtered @[src/main/scala/Seq/tricks.scala 54:14]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[src/main/scala/Seq/tricks.scala 27:44]
    risingEdge_REG <= btn_filtered @[src/main/scala/Seq/tricks.scala 27:44]
    node _risingEdge_T = eq(risingEdge_REG, UInt<1>("h0")) @[src/main/scala/Seq/tricks.scala 27:36]
    node risingEdge = and(btn_filtered, _risingEdge_T) @[src/main/scala/Seq/tricks.scala 27:34]
    reg reg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/tricks.scala 59:20]
    when risingEdge : @[src/main/scala/Seq/tricks.scala 60:19]
      node _reg_T = add(reg, UInt<1>("h1")) @[src/main/scala/Seq/tricks.scala 61:16]
      node _reg_T_1 = tail(_reg_T, 1) @[src/main/scala/Seq/tricks.scala 61:16]
      reg <= _reg_T_1 @[src/main/scala/Seq/tricks.scala 61:9]
    io.cnt <= reg @[src/main/scala/Seq/tricks.scala 63:10]

