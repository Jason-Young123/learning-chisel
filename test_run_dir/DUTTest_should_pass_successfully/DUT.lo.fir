FIRRTL version 1.2.0
circuit DUT :
  module DUT :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2> @[src/main/scala/DUT/DUT.scala 9:14]
    input io_b : UInt<2> @[src/main/scala/DUT/DUT.scala 9:14]
    output io_out : UInt<2> @[src/main/scala/DUT/DUT.scala 9:14]

    node _io_out_T = and(io_a, io_b) @[src/main/scala/DUT/DUT.scala 14:18]
    io_out <= _io_out_T @[src/main/scala/DUT/DUT.scala 14:10]
