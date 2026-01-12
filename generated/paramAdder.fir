FIRRTL version 1.2.0
circuit paramAdder :
  module paramAdder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<8>, flip b : UInt<8>, c : UInt<8>, carry : UInt<1>, d1 : UInt<8>, d2 : UInt<8>, d3 : UInt<9>, d4 : UInt<9>} @[src/main/scala/Utils/param.scala 12:14]

    node sum = add(io.a, io.b) @[src/main/scala/Utils/param.scala 25:18]
    node _io_c_T = bits(sum, 7, 0) @[src/main/scala/Utils/param.scala 26:14]
    io.c <= _io_c_T @[src/main/scala/Utils/param.scala 26:8]
    node _io_carry_T = bits(sum, 8, 8) @[src/main/scala/Utils/param.scala 27:18]
    io.carry <= _io_carry_T @[src/main/scala/Utils/param.scala 27:12]
    node _io_d1_T = add(io.a, io.b) @[src/main/scala/Utils/param.scala 29:17]
    node _io_d1_T_1 = tail(_io_d1_T, 1) @[src/main/scala/Utils/param.scala 29:17]
    io.d1 <= _io_d1_T_1 @[src/main/scala/Utils/param.scala 29:9]
    node _io_d2_T = add(io.a, io.b) @[src/main/scala/Utils/param.scala 30:17]
    io.d2 <= _io_d2_T @[src/main/scala/Utils/param.scala 30:9]
    node _io_d3_T = add(io.a, io.b) @[src/main/scala/Utils/param.scala 31:17]
    node _io_d3_T_1 = tail(_io_d3_T, 1) @[src/main/scala/Utils/param.scala 31:17]
    io.d3 <= _io_d3_T_1 @[src/main/scala/Utils/param.scala 31:9]
    node _io_d4_T = add(io.a, io.b) @[src/main/scala/Utils/param.scala 32:17]
    io.d4 <= _io_d4_T @[src/main/scala/Utils/param.scala 32:9]

