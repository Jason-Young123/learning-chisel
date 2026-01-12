FIRRTL version 1.2.0
circuit mealy :
  module mealy :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<1>, risingEdge : UInt<1>, risingEdge_ref : UInt<1>} @[src/main/scala/FSM/mealy.scala 8:14]

    reg io_risingEdge_ref_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_risingEdge_ref_REG) @[src/main/scala/FSM/mealy.scala 15:41]
    io_risingEdge_ref_REG <= io.din @[src/main/scala/FSM/mealy.scala 15:41]
    node _io_risingEdge_ref_T = eq(io_risingEdge_ref_REG, UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 15:33]
    node _io_risingEdge_ref_T_1 = and(io.din, _io_risingEdge_ref_T) @[src/main/scala/FSM/mealy.scala 15:31]
    io.risingEdge_ref <= _io_risingEdge_ref_T_1 @[src/main/scala/FSM/mealy.scala 15:21]
    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 20:25]
    io.risingEdge <= UInt<1>("h0") @[src/main/scala/FSM/mealy.scala 23:17]
    node _T = eq(UInt<1>("h0"), stateReg) @[src/main/scala/FSM/mealy.scala 26:19]
    when _T : @[src/main/scala/FSM/mealy.scala 26:19]
      when io.din : @[src/main/scala/FSM/mealy.scala 28:19]
        stateReg <= UInt<1>("h1") @[src/main/scala/FSM/mealy.scala 29:18]
        io.risingEdge <= UInt<1>("h1") @[src/main/scala/FSM/mealy.scala 30:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), stateReg) @[src/main/scala/FSM/mealy.scala 26:19]
      when _T_1 : @[src/main/scala/FSM/mealy.scala 26:19]
        io.risingEdge <= UInt<1>("h0") @[src/main/scala/FSM/mealy.scala 34:21]
        node _T_2 = eq(io.din, UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 35:12]
        when _T_2 : @[src/main/scala/FSM/mealy.scala 35:20]
          stateReg <= UInt<1>("h0") @[src/main/scala/FSM/mealy.scala 36:18]


