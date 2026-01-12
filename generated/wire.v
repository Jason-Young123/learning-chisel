module wire_(
  input   clock,
  input   reset,
  input   io_a, // @[src/main/scala/Comb/wire.scala 7:14]
  input   io_b, // @[src/main/scala/Comb/wire.scala 7:14]
  input   io_cond, // @[src/main/scala/Comb/wire.scala 7:14]
  output  io_y // @[src/main/scala/Comb/wire.scala 7:14]
);
  wire [1:0] w1 = io_cond ? 2'h3 : 2'h0; // @[src/main/scala/Comb/wire.scala 21:18 20:23 22:8]
  wire [1:0] w2 = io_cond ? 2'h1 : 2'h2; // @[src/main/scala/Comb/wire.scala 27:17 28:8 30:8]
  wire [1:0] _GEN_2 = w2[0] ? 2'h3 : 2'h0; // @[src/main/scala/Comb/wire.scala 39:23 40:8 42:8]
  wire [1:0] _GEN_3 = &w1 ? 2'h2 : _GEN_2; // @[src/main/scala/Comb/wire.scala 37:25 38:8]
  wire [1:0] w3 = io_cond ? 2'h1 : _GEN_3; // @[src/main/scala/Comb/wire.scala 35:18 36:8]
  wire  _GEN_5 = w3 == 2'h1 ? io_b : io_a & io_b; // @[src/main/scala/Comb/wire.scala 48:27 49:10 51:10]
  assign io_y = w3 == 2'h2 | w3 == 2'h3 ? io_a : _GEN_5; // @[src/main/scala/Comb/wire.scala 46:34 47:10]
endmodule
