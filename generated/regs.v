module regs(
  input        clock,
  input        reset,
  input  [7:0] io_in, // @[src/main/scala/Seq/regs.scala 6:14]
  input        io_en, // @[src/main/scala/Seq/regs.scala 6:14]
  output [7:0] io_out // @[src/main/scala/Seq/regs.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  reg0; // @[src/main/scala/Seq/regs.scala 13:21]
  reg  reg1; // @[src/main/scala/Seq/regs.scala 16:17]
  reg  reg2; // @[src/main/scala/Seq/regs.scala 20:21]
  reg  reg3; // @[src/main/scala/Seq/regs.scala 24:17]
  reg  reg4; // @[src/main/scala/Seq/regs.scala 30:21]
  reg  risingEdge_REG; // @[src/main/scala/Seq/regs.scala 35:39]
  wire  risingEdge = io_in[5] & ~risingEdge_REG; // @[src/main/scala/Seq/regs.scala 35:29]
  wire [2:0] io_out_lo = {reg2,reg1,reg0}; // @[src/main/scala/Seq/regs.scala 37:16]
  wire [4:0] io_out_hi = {2'h0,risingEdge,reg4,reg3}; // @[src/main/scala/Seq/regs.scala 37:16]
  assign io_out = {io_out_hi,io_out_lo}; // @[src/main/scala/Seq/regs.scala 37:16]
  always @(posedge clock) begin
    reg0 <= io_in[0]; // @[src/main/scala/Seq/regs.scala 13:27]
    reg1 <= io_in[1]; // @[src/main/scala/Seq/regs.scala 17:16]
    reg2 <= reset | io_in[2]; // @[src/main/scala/Seq/regs.scala 20:{21,21} 21:8]
    if (io_en) begin // @[src/main/scala/Seq/regs.scala 25:14]
      reg3 <= io_in[3]; // @[src/main/scala/Seq/regs.scala 26:10]
    end
    if (reset) begin // @[src/main/scala/Seq/regs.scala 30:21]
      reg4 <= 1'h0; // @[src/main/scala/Seq/regs.scala 30:21]
    end else if (io_en) begin // @[src/main/scala/Seq/regs.scala 31:14]
      reg4 <= io_in[4]; // @[src/main/scala/Seq/regs.scala 32:10]
    end
    risingEdge_REG <= io_in[5]; // @[src/main/scala/Seq/regs.scala 35:45]
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
  reg0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  risingEdge_REG = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
