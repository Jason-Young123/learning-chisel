module paramAdder(
  input        clock,
  input        reset,
  input  [7:0] io_a, // @[src/main/scala/Utils/param.scala 12:14]
  input  [7:0] io_b, // @[src/main/scala/Utils/param.scala 12:14]
  output [7:0] io_c, // @[src/main/scala/Utils/param.scala 12:14]
  output       io_carry, // @[src/main/scala/Utils/param.scala 12:14]
  output [7:0] io_d1, // @[src/main/scala/Utils/param.scala 12:14]
  output [7:0] io_d2, // @[src/main/scala/Utils/param.scala 12:14]
  output [8:0] io_d3, // @[src/main/scala/Utils/param.scala 12:14]
  output [8:0] io_d4 // @[src/main/scala/Utils/param.scala 12:14]
);
  wire [8:0] sum = io_a + io_b; // @[src/main/scala/Utils/param.scala 25:18]
  wire [7:0] _io_d1_T_1 = io_a + io_b; // @[src/main/scala/Utils/param.scala 29:17]
  assign io_c = sum[7:0]; // @[src/main/scala/Utils/param.scala 26:14]
  assign io_carry = sum[8]; // @[src/main/scala/Utils/param.scala 27:18]
  assign io_d1 = io_a + io_b; // @[src/main/scala/Utils/param.scala 29:17]
  assign io_d2 = sum[7:0]; // @[src/main/scala/Utils/param.scala 30:9]
  assign io_d3 = {{1'd0}, _io_d1_T_1}; // @[src/main/scala/Utils/param.scala 31:9]
  assign io_d4 = io_a + io_b; // @[src/main/scala/Utils/param.scala 32:17]
endmodule
