FIRRTL version 1.2.0
circuit funcHW :
  module funcHW :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip vec : UInt<8>[4], o1 : UInt<8>, o2 : UInt<8>, o3 : UInt<8>, o4 : UInt<8>} @[src/main/scala/Utils/funcHW.scala 13:14]

    node _io_o1_T = add(io.vec[0], io.vec[1]) @[src/main/scala/Utils/funcHW.scala 7:38]
    node _io_o1_T_1 = tail(_io_o1_T, 1) @[src/main/scala/Utils/funcHW.scala 7:38]
    node _io_o1_T_2 = add(_io_o1_T_1, io.vec[2]) @[src/main/scala/Utils/funcHW.scala 7:38]
    node _io_o1_T_3 = tail(_io_o1_T_2, 1) @[src/main/scala/Utils/funcHW.scala 7:38]
    node _io_o1_T_4 = add(_io_o1_T_3, io.vec[3]) @[src/main/scala/Utils/funcHW.scala 7:38]
    node _io_o1_T_5 = tail(_io_o1_T_4, 1) @[src/main/scala/Utils/funcHW.scala 7:38]
    io.o1 <= _io_o1_T_5 @[src/main/scala/Utils/funcHW.scala 22:9]
    node _io_o2_T = add(io.vec[0], io.vec[1]) @[src/main/scala/Utils/funcHW.scala 25:28]
    node _io_o2_T_1 = tail(_io_o2_T, 1) @[src/main/scala/Utils/funcHW.scala 25:28]
    node _io_o2_T_2 = add(_io_o2_T_1, io.vec[2]) @[src/main/scala/Utils/funcHW.scala 25:28]
    node _io_o2_T_3 = tail(_io_o2_T_2, 1) @[src/main/scala/Utils/funcHW.scala 25:28]
    node _io_o2_T_4 = add(_io_o2_T_3, io.vec[3]) @[src/main/scala/Utils/funcHW.scala 25:28]
    node _io_o2_T_5 = tail(_io_o2_T_4, 1) @[src/main/scala/Utils/funcHW.scala 25:28]
    io.o2 <= _io_o2_T_5 @[src/main/scala/Utils/funcHW.scala 25:9]
    node _io_o3_T = add(io.vec[0], io.vec[1]) @[src/main/scala/Utils/funcHW.scala 28:22]
    node _io_o3_T_1 = tail(_io_o3_T, 1) @[src/main/scala/Utils/funcHW.scala 28:22]
    node _io_o3_T_2 = add(_io_o3_T_1, io.vec[2]) @[src/main/scala/Utils/funcHW.scala 28:34]
    node _io_o3_T_3 = tail(_io_o3_T_2, 1) @[src/main/scala/Utils/funcHW.scala 28:34]
    node _io_o3_T_4 = add(_io_o3_T_3, io.vec[3]) @[src/main/scala/Utils/funcHW.scala 28:46]
    node _io_o3_T_5 = tail(_io_o3_T_4, 1) @[src/main/scala/Utils/funcHW.scala 28:46]
    io.o3 <= _io_o3_T_5 @[src/main/scala/Utils/funcHW.scala 28:9]
    node _io_o4_T = add(io.vec[0], io.vec[1]) @[src/main/scala/Utils/funcHW.scala 31:32]
    node _io_o4_T_1 = tail(_io_o4_T, 1) @[src/main/scala/Utils/funcHW.scala 31:32]
    node _io_o4_T_2 = add(io.vec[2], io.vec[3]) @[src/main/scala/Utils/funcHW.scala 31:32]
    node _io_o4_T_3 = tail(_io_o4_T_2, 1) @[src/main/scala/Utils/funcHW.scala 31:32]
    node _io_o4_T_4 = add(_io_o4_T_1, _io_o4_T_3) @[src/main/scala/Utils/funcHW.scala 31:32]
    node _io_o4_T_5 = tail(_io_o4_T_4, 1) @[src/main/scala/Utils/funcHW.scala 31:32]
    io.o4 <= _io_o4_T_5 @[src/main/scala/Utils/funcHW.scala 31:9]

