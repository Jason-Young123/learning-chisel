FIRRTL version 1.2.0
circuit DUT2 :
  module DUT2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, o : UInt<1>, o1 : UInt<1>} @[src/main/scala/DUT/DUT2.scala 7:14]

    reg reg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/DUT/DUT2.scala 13:20]
    when io.en : @[src/main/scala/DUT/DUT2.scala 16:14]
      node _reg_T = add(reg, UInt<1>("h1")) @[src/main/scala/DUT/DUT2.scala 17:16]
      node _reg_T_1 = tail(_reg_T, 1) @[src/main/scala/DUT/DUT2.scala 17:16]
      reg <= _reg_T_1 @[src/main/scala/DUT/DUT2.scala 17:9]
      node _T = eq(reg, UInt<3>("h6")) @[src/main/scala/DUT/DUT2.scala 18:14]
      when _T : @[src/main/scala/DUT/DUT2.scala 18:22]
        reg <= UInt<1>("h0") @[src/main/scala/DUT/DUT2.scala 19:11]
    wire tmp : UInt<1> @[src/main/scala/DUT/DUT2.scala 24:21]
    tmp <= UInt<1>("h0") @[src/main/scala/DUT/DUT2.scala 24:21]
    when io.en : @[src/main/scala/DUT/DUT2.scala 25:14]
      node _tmp_T = bits(reg, 1, 1) @[src/main/scala/DUT/DUT2.scala 26:15]
      tmp <= _tmp_T @[src/main/scala/DUT/DUT2.scala 26:9]
      when tmp : @[src/main/scala/DUT/DUT2.scala 27:14]
        node _io_o1_T = bits(reg, 2, 2) @[src/main/scala/DUT/DUT2.scala 28:19]
        io.o1 <= _io_o1_T @[src/main/scala/DUT/DUT2.scala 28:13]
      else :
        node _io_o1_T_1 = bits(reg, 3, 3) @[src/main/scala/DUT/DUT2.scala 30:19]
        io.o1 <= _io_o1_T_1 @[src/main/scala/DUT/DUT2.scala 30:13]
    else :
      io.o1 <= UInt<1>("h0") @[src/main/scala/DUT/DUT2.scala 33:11]
    node _io_o_T = bits(reg, 0, 0) @[src/main/scala/DUT/DUT2.scala 36:14]
    io.o <= _io_o_T @[src/main/scala/DUT/DUT2.scala 36:8]

