FIRRTL version 1.2.0
circuit func :
  module func :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip c : UInt<8>, flip d : UInt<8>, y : UInt<16>} @[src/main/scala/Comb/func.scala 19:14]

    node _tmp1_T = add(io.a, io.b) @[src/main/scala/Comb/func.scala 6:41]
    node tmp1 = tail(_tmp1_T, 1) @[src/main/scala/Comb/func.scala 6:41]
    node _tmp2_T = add(io.c, io.d) @[src/main/scala/Comb/func.scala 6:41]
    node tmp2 = tail(_tmp2_T, 1) @[src/main/scala/Comb/func.scala 6:41]
    node _tmp3_T = add(tmp1, tmp2) @[src/main/scala/Comb/func.scala 13:56]
    node tmp3 = tail(_tmp3_T, 1) @[src/main/scala/Comb/func.scala 13:56]
    reg io_y_REG : UInt, clock with :
      reset => (UInt<1>("h0"), io_y_REG) @[src/main/scala/Comb/func.scala 7:36]
    io_y_REG <= tmp3 @[src/main/scala/Comb/func.scala 7:36]
    reg io_y_REG_1 : UInt, clock with :
      reset => (UInt<1>("h0"), io_y_REG_1) @[src/main/scala/Comb/func.scala 14:52]
    io_y_REG_1 <= io_y_REG @[src/main/scala/Comb/func.scala 14:52]
    io.y <= io_y_REG_1 @[src/main/scala/Comb/func.scala 31:8]

