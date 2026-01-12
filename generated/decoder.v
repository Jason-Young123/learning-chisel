module decoder(
  input        clock,
  input        reset,
  input  [3:0] io_x, // @[src/main/scala/Comb/decoder.scala 7:14]
  output [7:0] io_y // @[src/main/scala/Comb/decoder.scala 7:14]
);
  wire [6:0] _GEN_0 = 4'h3 == io_x ? 7'h4a : 7'h0; // @[src/main/scala/Comb/decoder.scala 14:17 18:27 13:8]
  wire [6:0] _GEN_1 = 4'h2 == io_x ? 7'h23 : _GEN_0; // @[src/main/scala/Comb/decoder.scala 14:17 17:27]
  wire [6:0] _GEN_2 = 4'h1 == io_x ? 7'h31 : _GEN_1; // @[src/main/scala/Comb/decoder.scala 14:17 16:27]
  assign io_y = 4'h0 == io_x ? 8'h94 : {{1'd0}, _GEN_2}; // @[src/main/scala/Comb/decoder.scala 14:17 15:27]
endmodule
