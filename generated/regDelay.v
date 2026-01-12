module regDelay(
  input   clock,
  input   reset,
  input   io_a, // @[src/main/scala/Seq/regs.scala 43:14]
  output  io_b1, // @[src/main/scala/Seq/regs.scala 43:14]
  output  io_b2, // @[src/main/scala/Seq/regs.scala 43:14]
  output  io_b3, // @[src/main/scala/Seq/regs.scala 43:14]
  output  io_b4 // @[src/main/scala/Seq/regs.scala 43:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  myreg1; // @[src/main/scala/Seq/regs.scala 52:23]
  reg  myreg2; // @[src/main/scala/Seq/regs.scala 53:23]
  reg  myreg2_REG; // @[src/main/scala/Seq/regs.scala 55:20]
  reg  io_b4_REG; // @[src/main/scala/Seq/regs.scala 62:19]
  assign io_b1 = myreg1; // @[src/main/scala/Seq/regs.scala 57:9]
  assign io_b2 = myreg2; // @[src/main/scala/Seq/regs.scala 58:9]
  assign io_b3 = io_a; // @[src/main/scala/Seq/regs.scala 61:9]
  assign io_b4 = io_b4_REG; // @[src/main/scala/Seq/regs.scala 62:9]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Seq/regs.scala 52:23]
      myreg1 <= 1'h0; // @[src/main/scala/Seq/regs.scala 52:23]
    end else begin
      myreg1 <= io_a; // @[src/main/scala/Seq/regs.scala 54:10]
    end
    if (reset) begin // @[src/main/scala/Seq/regs.scala 53:23]
      myreg2 <= 1'h0; // @[src/main/scala/Seq/regs.scala 53:23]
    end else begin
      myreg2 <= myreg2_REG; // @[src/main/scala/Seq/regs.scala 55:10]
    end
    myreg2_REG <= io_a; // @[src/main/scala/Seq/regs.scala 55:20]
    io_b4_REG <= io_a; // @[src/main/scala/Seq/regs.scala 62:19]
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
  myreg1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  myreg2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  myreg2_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_b4_REG = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
