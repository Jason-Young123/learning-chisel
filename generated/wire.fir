FIRRTL version 1.2.0
circuit wire :
  module wire :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cond : UInt<1>, y : UInt<1>} @[src/main/scala/Comb/wire.scala 7:14]

    wire w1 : UInt<2> @[src/main/scala/Comb/wire.scala 20:23]
    w1 <= UInt<2>("h0") @[src/main/scala/Comb/wire.scala 20:23]
    when io.cond : @[src/main/scala/Comb/wire.scala 21:18]
      w1 <= UInt<2>("h3") @[src/main/scala/Comb/wire.scala 22:8]
    wire w2 : UInt<2> @[src/main/scala/Comb/wire.scala 26:16]
    when io.cond : @[src/main/scala/Comb/wire.scala 27:17]
      w2 <= UInt<1>("h1") @[src/main/scala/Comb/wire.scala 28:8]
    else :
      w2 <= UInt<2>("h2") @[src/main/scala/Comb/wire.scala 30:8]
    wire w3 : UInt<2> @[src/main/scala/Comb/wire.scala 34:16]
    when io.cond : @[src/main/scala/Comb/wire.scala 35:18]
      w3 <= UInt<1>("h1") @[src/main/scala/Comb/wire.scala 36:8]
    else :
      node _T = andr(w1) @[src/main/scala/Comb/wire.scala 37:19]
      when _T : @[src/main/scala/Comb/wire.scala 37:25]
        w3 <= UInt<2>("h2") @[src/main/scala/Comb/wire.scala 38:8]
      else :
        node _T_1 = bits(w2, 0, 0) @[src/main/scala/Comb/wire.scala 39:18]
        when _T_1 : @[src/main/scala/Comb/wire.scala 39:23]
          w3 <= UInt<2>("h3") @[src/main/scala/Comb/wire.scala 40:8]
        else :
          w3 <= UInt<1>("h0") @[src/main/scala/Comb/wire.scala 42:8]
    node _T_2 = eq(w3, UInt<2>("h2")) @[src/main/scala/Comb/wire.scala 46:12]
    node _T_3 = eq(w3, UInt<2>("h3")) @[src/main/scala/Comb/wire.scala 46:26]
    node _T_4 = or(_T_2, _T_3) @[src/main/scala/Comb/wire.scala 46:20]
    when _T_4 : @[src/main/scala/Comb/wire.scala 46:34]
      io.y <= io.a @[src/main/scala/Comb/wire.scala 47:10]
    else :
      node _T_5 = eq(w3, UInt<1>("h1")) @[src/main/scala/Comb/wire.scala 48:19]
      when _T_5 : @[src/main/scala/Comb/wire.scala 48:27]
        io.y <= io.b @[src/main/scala/Comb/wire.scala 49:10]
      else :
        node _io_y_T = and(io.a, io.b) @[src/main/scala/Comb/wire.scala 51:18]
        io.y <= _io_y_T @[src/main/scala/Comb/wire.scala 51:10]


