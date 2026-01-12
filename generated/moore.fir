FIRRTL version 1.2.0
circuit moore :
  module moore :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip badEvent : UInt<1>, flip clear : UInt<1>, ringBell : UInt<1>} @[src/main/scala/FSM/moore.scala 7:14]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FSM/moore.scala 15:25]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FSM/moore.scala 17:20]
    when _T : @[src/main/scala/FSM/moore.scala 17:20]
      when io.badEvent : @[src/main/scala/FSM/moore.scala 19:24]
        stateReg <= UInt<2>("h1") @[src/main/scala/FSM/moore.scala 20:18]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FSM/moore.scala 17:20]
      when _T_1 : @[src/main/scala/FSM/moore.scala 17:20]
        when io.badEvent : @[src/main/scala/FSM/moore.scala 24:24]
          stateReg <= UInt<2>("h2") @[src/main/scala/FSM/moore.scala 25:18]
        else :
          when io.clear : @[src/main/scala/FSM/moore.scala 26:28]
            stateReg <= UInt<2>("h0") @[src/main/scala/FSM/moore.scala 27:18]
      else :
        node _T_2 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FSM/moore.scala 17:20]
        when _T_2 : @[src/main/scala/FSM/moore.scala 17:20]
          when io.clear : @[src/main/scala/FSM/moore.scala 31:21]
            stateReg <= UInt<2>("h0") @[src/main/scala/FSM/moore.scala 32:18]
    node _io_ringBell_T = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FSM/moore.scala 37:28]
    io.ringBell <= _io_ringBell_T @[src/main/scala/FSM/moore.scala 37:15]

