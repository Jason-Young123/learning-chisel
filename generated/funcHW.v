module funcHW(
  input        clock,
  input        reset,
  input  [7:0] io_vec_0, // @[src/main/scala/Utils/funcHW.scala 13:14]
  input  [7:0] io_vec_1, // @[src/main/scala/Utils/funcHW.scala 13:14]
  input  [7:0] io_vec_2, // @[src/main/scala/Utils/funcHW.scala 13:14]
  input  [7:0] io_vec_3, // @[src/main/scala/Utils/funcHW.scala 13:14]
  output [7:0] io_o1, // @[src/main/scala/Utils/funcHW.scala 13:14]
  output [7:0] io_o2, // @[src/main/scala/Utils/funcHW.scala 13:14]
  output [7:0] io_o3, // @[src/main/scala/Utils/funcHW.scala 13:14]
  output [7:0] io_o4 // @[src/main/scala/Utils/funcHW.scala 13:14]
);
  wire [7:0] _io_o1_T_1 = io_vec_0 + io_vec_1; // @[src/main/scala/Utils/funcHW.scala 7:38]
  wire [7:0] _io_o1_T_3 = _io_o1_T_1 + io_vec_2; // @[src/main/scala/Utils/funcHW.scala 7:38]
  wire [7:0] _io_o4_T_3 = io_vec_2 + io_vec_3; // @[src/main/scala/Utils/funcHW.scala 31:32]
  assign io_o1 = _io_o1_T_3 + io_vec_3; // @[src/main/scala/Utils/funcHW.scala 7:38]
  assign io_o2 = _io_o1_T_3 + io_vec_3; // @[src/main/scala/Utils/funcHW.scala 25:28]
  assign io_o3 = _io_o1_T_3 + io_vec_3; // @[src/main/scala/Utils/funcHW.scala 28:46]
  assign io_o4 = _io_o1_T_1 + _io_o4_T_3; // @[src/main/scala/Utils/funcHW.scala 31:32]
endmodule
