module DUT2(
  input   clock,
  input   reset,
  input   io_en, // @[src/main/scala/DUT/DUT2.scala 7:14]
  output  io_o, // @[src/main/scala/DUT/DUT2.scala 7:14]
  output  io_o1 // @[src/main/scala/DUT/DUT2.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] reg_; // @[src/main/scala/DUT/DUT2.scala 13:20]
  wire [3:0] _reg_T_1 = reg_ + 4'h1; // @[src/main/scala/DUT/DUT2.scala 17:16]
  wire  tmp = io_en & reg_[1]; // @[src/main/scala/DUT/DUT2.scala 25:14 24:21 26:9]
  wire  _GEN_2 = tmp ? reg_[2] : reg_[3]; // @[src/main/scala/DUT/DUT2.scala 27:14 28:13 30:13]
  assign io_o = reg_[0]; // @[src/main/scala/DUT/DUT2.scala 36:14]
  assign io_o1 = io_en & _GEN_2; // @[src/main/scala/DUT/DUT2.scala 25:14 33:11]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/DUT/DUT2.scala 13:20]
      reg_ <= 4'h0; // @[src/main/scala/DUT/DUT2.scala 13:20]
    end else if (io_en) begin // @[src/main/scala/DUT/DUT2.scala 16:14]
      if (reg_ == 4'h6) begin // @[src/main/scala/DUT/DUT2.scala 18:22]
        reg_ <= 4'h0; // @[src/main/scala/DUT/DUT2.scala 19:11]
      end else begin
        reg_ <= _reg_T_1; // @[src/main/scala/DUT/DUT2.scala 17:9]
      end
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
  reg_ = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
