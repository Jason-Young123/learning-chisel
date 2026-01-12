module tricks(
  input        clock,
  input        reset,
  input        io_btn_async, // @[src/main/scala/Seq/tricks.scala 34:14]
  output       io_btn_out, // @[src/main/scala/Seq/tricks.scala 34:14]
  output [3:0] io_cnt // @[src/main/scala/Seq/tricks.scala 34:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  btn_sync_REG; // @[src/main/scala/Seq/tricks.scala 7:44]
  reg  btn_sync; // @[src/main/scala/Seq/tricks.scala 7:36]
  reg [3:0] tick_cntReg; // @[src/main/scala/Seq/tricks.scala 11:25]
  wire  tick = tick_cntReg == 4'ha; // @[src/main/scala/Seq/tricks.scala 12:24]
  wire [3:0] _tick_cntReg_T_1 = tick_cntReg + 4'h1; // @[src/main/scala/Seq/tricks.scala 13:37]
  reg  btn_debounce; // @[src/main/scala/Seq/tricks.scala 47:25]
  reg [2:0] btn_filtered_shiftReg; // @[src/main/scala/Seq/tricks.scala 19:27]
  wire [2:0] _btn_filtered_shiftReg_T_1 = {btn_filtered_shiftReg[1:0],btn_debounce}; // @[src/main/scala/Seq/tricks.scala 21:22]
  wire  btn_filtered = btn_filtered_shiftReg[2] & btn_filtered_shiftReg[1] | btn_filtered_shiftReg[2] &
    btn_filtered_shiftReg[0] | btn_filtered_shiftReg[1] & btn_filtered_shiftReg[1]; // @[src/main/scala/Seq/tricks.scala 23:63]
  reg  risingEdge_REG; // @[src/main/scala/Seq/tricks.scala 27:44]
  wire  risingEdge = btn_filtered & ~risingEdge_REG; // @[src/main/scala/Seq/tricks.scala 27:34]
  reg [3:0] reg_; // @[src/main/scala/Seq/tricks.scala 59:20]
  wire [3:0] _reg_T_1 = reg_ + 4'h1; // @[src/main/scala/Seq/tricks.scala 61:16]
  assign io_btn_out = btn_filtered_shiftReg[2] & btn_filtered_shiftReg[1] | btn_filtered_shiftReg[2] &
    btn_filtered_shiftReg[0] | btn_filtered_shiftReg[1] & btn_filtered_shiftReg[1]; // @[src/main/scala/Seq/tricks.scala 23:63]
  assign io_cnt = reg_; // @[src/main/scala/Seq/tricks.scala 63:10]
  always @(posedge clock) begin
    btn_sync_REG <= io_btn_async; // @[src/main/scala/Seq/tricks.scala 7:44]
    btn_sync <= btn_sync_REG; // @[src/main/scala/Seq/tricks.scala 7:36]
    if (reset) begin // @[src/main/scala/Seq/tricks.scala 11:25]
      tick_cntReg <= 4'h0; // @[src/main/scala/Seq/tricks.scala 11:25]
    end else if (tick) begin // @[src/main/scala/Seq/tricks.scala 13:18]
      tick_cntReg <= 4'h0;
    end else begin
      tick_cntReg <= _tick_cntReg_T_1;
    end
    if (tick) begin // @[src/main/scala/Seq/tricks.scala 48:13]
      btn_debounce <= btn_sync; // @[src/main/scala/Seq/tricks.scala 49:18]
    end
    if (reset) begin // @[src/main/scala/Seq/tricks.scala 19:27]
      btn_filtered_shiftReg <= 3'h0; // @[src/main/scala/Seq/tricks.scala 19:27]
    end else if (tick) begin // @[src/main/scala/Seq/tricks.scala 20:15]
      btn_filtered_shiftReg <= _btn_filtered_shiftReg_T_1; // @[src/main/scala/Seq/tricks.scala 21:16]
    end
    risingEdge_REG <= btn_filtered_shiftReg[2] & btn_filtered_shiftReg[1] | btn_filtered_shiftReg[2] &
      btn_filtered_shiftReg[0] | btn_filtered_shiftReg[1] & btn_filtered_shiftReg[1]; // @[src/main/scala/Seq/tricks.scala 23:63]
    if (reset) begin // @[src/main/scala/Seq/tricks.scala 59:20]
      reg_ <= 4'h0; // @[src/main/scala/Seq/tricks.scala 59:20]
    end else if (risingEdge) begin // @[src/main/scala/Seq/tricks.scala 60:19]
      reg_ <= _reg_T_1; // @[src/main/scala/Seq/tricks.scala 61:9]
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
  btn_sync_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btn_sync = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tick_cntReg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  btn_debounce = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  btn_filtered_shiftReg = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  risingEdge_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_ = _RAND_6[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
