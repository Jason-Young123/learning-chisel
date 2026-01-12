module shiftregs(
  input        clock,
  input        reset,
  input        io_serIn, // @[src/main/scala/Seq/shiftregs.scala 6:14]
  input  [3:0] io_paraIn, // @[src/main/scala/Seq/shiftregs.scala 6:14]
  input        io_load, // @[src/main/scala/Seq/shiftregs.scala 6:14]
  output [3:0] io_out // @[src/main/scala/Seq/shiftregs.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] outReg; // @[src/main/scala/Seq/shiftregs.scala 13:23]
  wire [3:0] _outReg_T_1 = {outReg[2:0],io_serIn}; // @[src/main/scala/Seq/shiftregs.scala 17:18]
  assign io_out = outReg; // @[src/main/scala/Seq/shiftregs.scala 20:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Seq/shiftregs.scala 13:23]
      outReg <= 4'h0; // @[src/main/scala/Seq/shiftregs.scala 13:23]
    end else if (io_load) begin // @[src/main/scala/Seq/shiftregs.scala 14:17]
      outReg <= io_paraIn; // @[src/main/scala/Seq/shiftregs.scala 15:12]
    end else begin
      outReg <= _outReg_T_1; // @[src/main/scala/Seq/shiftregs.scala 17:12]
    end
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
  outReg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
