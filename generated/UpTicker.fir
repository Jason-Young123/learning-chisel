FIRRTL version 1.2.0
circuit UpTicker :
  module UpTicker :
    input clock : Clock
    input reset : UInt<1>
    output io : { tick : UInt<1>} @[src/main/scala/Utils/inherit.scala 7:14]

    reg cntReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/Utils/inherit.scala 16:23]
    node _cntReg_T = eq(cntReg, UInt<5>("h13")) @[src/main/scala/Utils/inherit.scala 24:24]
    node _cntReg_T_1 = add(cntReg, UInt<1>("h1")) @[src/main/scala/Utils/inherit.scala 24:49]
    node _cntReg_T_2 = tail(_cntReg_T_1, 1) @[src/main/scala/Utils/inherit.scala 24:49]
    node _cntReg_T_3 = mux(_cntReg_T, UInt<1>("h0"), _cntReg_T_2) @[src/main/scala/Utils/inherit.scala 24:16]
    cntReg <= _cntReg_T_3 @[src/main/scala/Utils/inherit.scala 24:10]
    node _io_tick_T = eq(cntReg, UInt<5>("h13")) @[src/main/scala/Utils/inherit.scala 26:22]
    io.tick <= _io_tick_T @[src/main/scala/Utils/inherit.scala 26:11]

