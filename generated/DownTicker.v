module DownTicker(
  input   clock,
  input   reset,
  output  io_tick // @[src/main/scala/Utils/inherit.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] cntReg; // @[src/main/scala/Utils/inherit.scala 33:23]
  wire [7:0] _cntReg_T_2 = cntReg - 8'h1; // @[src/main/scala/Utils/inherit.scala 35:49]
  assign io_tick = cntReg == 8'h0; // @[src/main/scala/Utils/inherit.scala 37:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Utils/inherit.scala 33:23]
      cntReg <= 8'h1d; // @[src/main/scala/Utils/inherit.scala 33:23]
    end else if (cntReg == 8'h0) begin // @[src/main/scala/Utils/inherit.scala 35:16]
      cntReg <= 8'h1d;
    end else begin
      cntReg <= _cntReg_T_2;
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
  cntReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
