FIRRTL version 1.2.0
circuit mealy :
  module mealy :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1> @[src/main/scala/FSM/mealy.scala 9:14]
    output io_risingEdge : UInt<1> @[src/main/scala/FSM/mealy.scala 9:14]
    output io_risingEdge_ref : UInt<1> @[src/main/scala/FSM/mealy.scala 9:14]

    reg io_risingEdge_ref_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_risingEdge_ref_REG) @[src/main/scala/FSM/mealy.scala 16:41]
    node _io_risingEdge_ref_T = eq(io_risingEdge_ref_REG, UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 16:33]
    node _io_risingEdge_ref_T_1 = and(io_din, _io_risingEdge_ref_T) @[src/main/scala/FSM/mealy.scala 16:31]
    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/FSM/mealy.scala 21:25]
    node _T = eq(UInt<1>("h0"), stateReg) @[src/main/scala/FSM/mealy.scala 27:19]
    node _GEN_0 = mux(io_din, UInt<1>("h1"), stateReg) @[src/main/scala/FSM/mealy.scala 29:19 30:18 21:25]
    node _GEN_1 = mux(io_din, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 24:17 29:19 33:23]
    node _T_1 = eq(UInt<1>("h1"), stateReg) @[src/main/scala/FSM/mealy.scala 27:19]
    node _T_2 = eq(io_din, UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 39:12]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), stateReg) @[src/main/scala/FSM/mealy.scala 39:20 40:18 21:25]
    node _GEN_3 = mux(_T_1, UInt<1>("h0"), UInt<1>("h0")) @[src/main/scala/FSM/mealy.scala 24:17 27:19 38:21]
    node _GEN_4 = mux(_T_1, _GEN_2, stateReg) @[src/main/scala/FSM/mealy.scala 27:19 21:25]
    node _GEN_5 = mux(_T, _GEN_0, _GEN_4) @[src/main/scala/FSM/mealy.scala 27:19]
    node _GEN_6 = mux(_T, _GEN_1, _GEN_3) @[src/main/scala/FSM/mealy.scala 27:19]
    io_risingEdge <= _GEN_6
    io_risingEdge_ref <= _io_risingEdge_ref_T_1 @[src/main/scala/FSM/mealy.scala 16:21]
    io_risingEdge_ref_REG <= io_din @[src/main/scala/FSM/mealy.scala 16:41]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_5) @[src/main/scala/FSM/mealy.scala 21:{25,25}]
