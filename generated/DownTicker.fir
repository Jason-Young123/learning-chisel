FIRRTL version 1.2.0
circuit DownTicker :
  module DownTicker :
    input clock : Clock
    input reset : UInt<1>
    output io : { tick : UInt<1>} @[src/main/scala/Utils/inherit.scala 7:14]

    reg cntReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h1d")) @[src/main/scala/Utils/inherit.scala 33:23]
    node _cntReg_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Utils/inherit.scala 35:24]
    node _cntReg_T_1 = sub(cntReg, UInt<1>("h1")) @[src/main/scala/Utils/inherit.scala 35:49]
    node _cntReg_T_2 = tail(_cntReg_T_1, 1) @[src/main/scala/Utils/inherit.scala 35:49]
    node _cntReg_T_3 = mux(_cntReg_T, UInt<5>("h1d"), _cntReg_T_2) @[src/main/scala/Utils/inherit.scala 35:16]
    cntReg <= _cntReg_T_3 @[src/main/scala/Utils/inherit.scala 35:10]
    node _io_tick_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Utils/inherit.scala 37:22]
    io.tick <= _io_tick_T @[src/main/scala/Utils/inherit.scala 37:11]

