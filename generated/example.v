module example(
  input        clock,
  input        reset,
  input  [3:0] io_a, // @[src/main/scala/Comb/operator.scala 60:14]
  input  [3:0] io_b, // @[src/main/scala/Comb/operator.scala 60:14]
  output [7:0] io_o // @[src/main/scala/Comb/operator.scala 60:14]
);
  assign io_o = $signed(io_a) * $signed(io_b); // @[src/main/scala/Comb/operator.scala 66:16]
endmodule
