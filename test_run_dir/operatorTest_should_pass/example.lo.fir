FIRRTL version 1.2.0
circuit example :
  module example :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<4> @[src/main/scala/Comb/operator.scala 60:14]
    input io_b : SInt<4> @[src/main/scala/Comb/operator.scala 60:14]
    output io_o : SInt<8> @[src/main/scala/Comb/operator.scala 60:14]

    node _io_o_T = mul(io_a, io_b) @[src/main/scala/Comb/operator.scala 66:16]
    io_o <= _io_o_T @[src/main/scala/Comb/operator.scala 66:8]
