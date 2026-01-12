module param(
  input        clock,
  input        reset,
  input        io_sel, // @[src/main/scala/Utils/param.scala 47:14]
  output [3:0] io_out1, // @[src/main/scala/Utils/param.scala 47:14]
  output [3:0] io_out2, // @[src/main/scala/Utils/param.scala 47:14]
  output [9:0] io_out3 // @[src/main/scala/Utils/param.scala 47:14]
);
  wire  _result2_T = ~io_sel; // @[src/main/scala/Utils/param.scala 62:23]
  assign io_out1 = io_sel ? 4'h5 : 4'ha; // @[src/main/scala/Utils/param.scala 37:14 38:11 36:23]
  assign io_out2 = _result2_T ? $signed(-4'sh2) : $signed(4'sh5); // @[src/main/scala/Utils/param.scala 37:14 38:11 36:23]
  assign io_out3 = io_sel ? 10'ha : 10'he; // @[src/main/scala/Utils/param.scala 37:14 38:11 36:23]
endmodule
