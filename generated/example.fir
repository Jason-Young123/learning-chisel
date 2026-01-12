FIRRTL version 1.2.0
circuit example :
  module example :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : SInt<4>, flip b : SInt<4>, o : SInt<8>} @[src/main/scala/Comb/operator.scala 60:14]

    node _io_o_T = mul(io.a, io.b) @[src/main/scala/Comb/operator.scala 66:16]
    io.o <= _io_o_T @[src/main/scala/Comb/operator.scala 66:8]

