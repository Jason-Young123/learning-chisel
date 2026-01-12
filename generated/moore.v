module moore(
  input   clock,
  input   reset,
  input   io_badEvent, // @[src/main/scala/FSM/moore.scala 7:14]
  input   io_clear, // @[src/main/scala/FSM/moore.scala 7:14]
  output  io_ringBell // @[src/main/scala/FSM/moore.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[src/main/scala/FSM/moore.scala 15:25]
  wire [1:0] _GEN_1 = io_clear ? 2'h0 : stateReg; // @[src/main/scala/FSM/moore.scala 26:28 27:18 15:25]
  assign io_ringBell = stateReg == 2'h2; // @[src/main/scala/FSM/moore.scala 37:28]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM/moore.scala 15:25]
      stateReg <= 2'h0; // @[src/main/scala/FSM/moore.scala 15:25]
    end else if (2'h0 == stateReg) begin // @[src/main/scala/FSM/moore.scala 17:20]
      if (io_badEvent) begin // @[src/main/scala/FSM/moore.scala 19:24]
        stateReg <= 2'h1; // @[src/main/scala/FSM/moore.scala 20:18]
      end
    end else if (2'h1 == stateReg) begin // @[src/main/scala/FSM/moore.scala 17:20]
      if (io_badEvent) begin // @[src/main/scala/FSM/moore.scala 24:24]
        stateReg <= 2'h2; // @[src/main/scala/FSM/moore.scala 25:18]
      end else begin
        stateReg <= _GEN_1;
      end
    end else if (2'h2 == stateReg) begin // @[src/main/scala/FSM/moore.scala 17:20]
      stateReg <= _GEN_1;
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
  stateReg = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
