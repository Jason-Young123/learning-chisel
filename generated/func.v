module func(
  input         clock,
  input         reset,
  input  [7:0]  io_a, // @[src/main/scala/Comb/func.scala 19:14]
  input  [7:0]  io_b, // @[src/main/scala/Comb/func.scala 19:14]
  input  [7:0]  io_c, // @[src/main/scala/Comb/func.scala 19:14]
  input  [7:0]  io_d, // @[src/main/scala/Comb/func.scala 19:14]
  output [15:0] io_y // @[src/main/scala/Comb/func.scala 19:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] tmp1 = io_a + io_b; // @[src/main/scala/Comb/func.scala 6:41]
  wire [7:0] tmp2 = io_c + io_d; // @[src/main/scala/Comb/func.scala 6:41]
  reg [7:0] io_y_REG; // @[src/main/scala/Comb/func.scala 7:36]
  reg [7:0] io_y_REG_1; // @[src/main/scala/Comb/func.scala 14:52]
  assign io_y = {{8'd0}, io_y_REG_1}; // @[src/main/scala/Comb/func.scala 31:8]
  always @(posedge clock) begin
    io_y_REG <= tmp1 + tmp2; // @[src/main/scala/Comb/func.scala 13:56]
    io_y_REG_1 <= io_y_REG; // @[src/main/scala/Comb/func.scala 14:52]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_y_REG = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  io_y_REG_1 = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
