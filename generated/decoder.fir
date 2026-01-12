FIRRTL version 1.2.0
circuit decoder :
  module decoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : UInt<4>, y : UInt<8>} @[src/main/scala/Comb/decoder.scala 7:14]

    io.y <= UInt<1>("h0") @[src/main/scala/Comb/decoder.scala 13:8]
    node _T = eq(UInt<1>("h0"), io.x) @[src/main/scala/Comb/decoder.scala 14:17]
    when _T : @[src/main/scala/Comb/decoder.scala 14:17]
      io.y <= UInt<8>("h94") @[src/main/scala/Comb/decoder.scala 15:27]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.x) @[src/main/scala/Comb/decoder.scala 14:17]
      when _T_1 : @[src/main/scala/Comb/decoder.scala 14:17]
        io.y <= UInt<6>("h31") @[src/main/scala/Comb/decoder.scala 16:27]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.x) @[src/main/scala/Comb/decoder.scala 14:17]
        when _T_2 : @[src/main/scala/Comb/decoder.scala 14:17]
          io.y <= UInt<6>("h23") @[src/main/scala/Comb/decoder.scala 17:27]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.x) @[src/main/scala/Comb/decoder.scala 14:17]
          when _T_3 : @[src/main/scala/Comb/decoder.scala 14:17]
            io.y <= UInt<7>("h4a") @[src/main/scala/Comb/decoder.scala 18:27]


