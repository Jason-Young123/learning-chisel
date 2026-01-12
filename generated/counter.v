module counter(
  input        clock,
  input        reset,
  input        io_en, // @[src/main/scala/Seq/counter.scala 27:14]
  input        io_dir, // @[src/main/scala/Seq/counter.scala 27:14]
  output [3:0] io_out, // @[src/main/scala/Seq/counter.scala 27:14]
  output [3:0] io_out1, // @[src/main/scala/Seq/counter.scala 27:14]
  output [3:0] io_out2, // @[src/main/scala/Seq/counter.scala 27:14]
  output       io_pwm_clk, // @[src/main/scala/Seq/counter.scala 27:14]
  output       io_mod_sig // @[src/main/scala/Seq/counter.scala 27:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] cntReg; // @[src/main/scala/Seq/counter.scala 38:23]
  wire [3:0] _cntReg_T_2 = cntReg + 4'h1; // @[src/main/scala/Seq/counter.scala 41:49]
  wire [3:0] _cntReg_T_6 = cntReg - 4'h1; // @[src/main/scala/Seq/counter.scala 43:49]
  reg [3:0] upcnt; // @[src/main/scala/Seq/counter.scala 8:25]
  wire [3:0] _upcnt_cntReg_T_2 = upcnt + 4'h1; // @[src/main/scala/Seq/counter.scala 9:45]
  reg [3:0] tickCntReg; // @[src/main/scala/Seq/counter.scala 54:27]
  wire  tick = tickCntReg == 4'ha; // @[src/main/scala/Seq/counter.scala 55:26]
  wire [3:0] _tickCntReg_T_1 = tickCntReg + 4'h1; // @[src/main/scala/Seq/counter.scala 56:28]
  reg [3:0] lowFrqCntReg; // @[src/main/scala/Seq/counter.scala 61:29]
  wire [3:0] _lowFrqCntReg_T_1 = lowFrqCntReg + 4'h1; // @[src/main/scala/Seq/counter.scala 63:34]
  reg [3:0] dout_cntReg; // @[src/main/scala/Seq/counter.scala 18:25]
  wire [3:0] _dout_cntReg_T_2 = dout_cntReg + 4'h1; // @[src/main/scala/Seq/counter.scala 19:52]
  wire [16:0] MAX = 17'h186a0 / 7'h64; // @[src/main/scala/Seq/counter.scala 74:17]
  reg [31:0] modulationReg; // @[src/main/scala/Seq/counter.scala 75:30]
  reg  upReg; // @[src/main/scala/Seq/counter.scala 76:22]
  wire [31:0] _modulationReg_T_1 = modulationReg + 32'h1; // @[src/main/scala/Seq/counter.scala 80:36]
  wire [31:0] _modulationReg_T_3 = modulationReg - 32'h1; // @[src/main/scala/Seq/counter.scala 84:36]
  wire  _GEN_5 = modulationReg > 32'h0 & ~upReg ? upReg : 1'h1; // @[src/main/scala/Seq/counter.scala 76:22 83:46 86:11]
  wire  _GEN_6 = modulationReg == 32'h186a0 & upReg ? 1'h0 : _GEN_5; // @[src/main/scala/Seq/counter.scala 81:48 82:11]
  wire  _GEN_9 = modulationReg < 32'h186a0 & upReg ? upReg : _GEN_6; // @[src/main/scala/Seq/counter.scala 76:22 79:39]
  wire [31:0] _sig_T = modulationReg / 7'h64; // @[src/main/scala/Seq/counter.scala 88:46]
  reg [16:0] sig_cntReg; // @[src/main/scala/Seq/counter.scala 18:25]
  wire [16:0] _sig_cntReg_T_2 = sig_cntReg + 17'h1; // @[src/main/scala/Seq/counter.scala 19:52]
  wire [31:0] _GEN_10 = {{15'd0}, sig_cntReg}; // @[src/main/scala/Seq/counter.scala 20:14]
  assign io_out = cntReg; // @[src/main/scala/Seq/counter.scala 46:10]
  assign io_out1 = upcnt; // @[src/main/scala/Seq/counter.scala 50:11]
  assign io_out2 = lowFrqCntReg; // @[src/main/scala/Seq/counter.scala 65:11]
  assign io_pwm_clk = 4'h3 > dout_cntReg; // @[src/main/scala/Seq/counter.scala 20:14]
  assign io_mod_sig = _sig_T > _GEN_10; // @[src/main/scala/Seq/counter.scala 20:14]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Seq/counter.scala 38:23]
      cntReg <= 4'h0; // @[src/main/scala/Seq/counter.scala 38:23]
    end else if (io_en) begin // @[src/main/scala/Seq/counter.scala 39:14]
      if (io_dir) begin // @[src/main/scala/Seq/counter.scala 40:17]
        if (cntReg == 4'h7) begin // @[src/main/scala/Seq/counter.scala 41:20]
          cntReg <= 4'h0;
        end else begin
          cntReg <= _cntReg_T_2;
        end
      end else if (cntReg == 4'h0) begin // @[src/main/scala/Seq/counter.scala 43:20]
        cntReg <= 4'h7;
      end else begin
        cntReg <= _cntReg_T_6;
      end
    end
    if (reset) begin // @[src/main/scala/Seq/counter.scala 8:25]
      upcnt <= 4'h0; // @[src/main/scala/Seq/counter.scala 8:25]
    end else if (upcnt == 4'hb) begin // @[src/main/scala/Seq/counter.scala 9:18]
      upcnt <= 4'h0;
    end else begin
      upcnt <= _upcnt_cntReg_T_2;
    end
    if (reset) begin // @[src/main/scala/Seq/counter.scala 54:27]
      tickCntReg <= 4'h0; // @[src/main/scala/Seq/counter.scala 54:27]
    end else if (tick) begin // @[src/main/scala/Seq/counter.scala 57:15]
      tickCntReg <= 4'h0; // @[src/main/scala/Seq/counter.scala 58:16]
    end else begin
      tickCntReg <= _tickCntReg_T_1; // @[src/main/scala/Seq/counter.scala 56:14]
    end
    if (reset) begin // @[src/main/scala/Seq/counter.scala 61:29]
      lowFrqCntReg <= 4'h0; // @[src/main/scala/Seq/counter.scala 61:29]
    end else if (tick) begin // @[src/main/scala/Seq/counter.scala 62:15]
      lowFrqCntReg <= _lowFrqCntReg_T_1; // @[src/main/scala/Seq/counter.scala 63:18]
    end
    if (reset) begin // @[src/main/scala/Seq/counter.scala 18:25]
      dout_cntReg <= 4'h0; // @[src/main/scala/Seq/counter.scala 18:25]
    end else if (dout_cntReg == 4'ha) begin // @[src/main/scala/Seq/counter.scala 19:18]
      dout_cntReg <= 4'h0;
    end else begin
      dout_cntReg <= _dout_cntReg_T_2;
    end
    if (reset) begin // @[src/main/scala/Seq/counter.scala 75:30]
      modulationReg <= 32'h0; // @[src/main/scala/Seq/counter.scala 75:30]
    end else if (modulationReg < 32'h186a0 & upReg) begin // @[src/main/scala/Seq/counter.scala 79:39]
      modulationReg <= _modulationReg_T_1; // @[src/main/scala/Seq/counter.scala 80:19]
    end else if (!(modulationReg == 32'h186a0 & upReg)) begin // @[src/main/scala/Seq/counter.scala 81:48]
      if (modulationReg > 32'h0 & ~upReg) begin // @[src/main/scala/Seq/counter.scala 83:46]
        modulationReg <= _modulationReg_T_3; // @[src/main/scala/Seq/counter.scala 84:19]
      end
    end
    upReg <= reset | _GEN_9; // @[src/main/scala/Seq/counter.scala 76:{22,22}]
    if (reset) begin // @[src/main/scala/Seq/counter.scala 18:25]
      sig_cntReg <= 17'h0; // @[src/main/scala/Seq/counter.scala 18:25]
    end else if (sig_cntReg == MAX) begin // @[src/main/scala/Seq/counter.scala 19:18]
      sig_cntReg <= 17'h0;
    end else begin
      sig_cntReg <= _sig_cntReg_T_2;
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
  cntReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  upcnt = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  tickCntReg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  lowFrqCntReg = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  dout_cntReg = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  modulationReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  upReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sig_cntReg = _RAND_7[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
