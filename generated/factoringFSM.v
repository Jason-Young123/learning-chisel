module masterFSM(
  input   clock,
  input   reset,
  input   io_start, // @[src/main/scala/FSM/factoringFSM.scala 7:14]
  output  io_light, // @[src/main/scala/FSM/factoringFSM.scala 7:14]
  output  io_timerLoad, // @[src/main/scala/FSM/factoringFSM.scala 7:14]
  output  io_timerSelect, // @[src/main/scala/FSM/factoringFSM.scala 7:14]
  input   io_timerDone // @[src/main/scala/FSM/factoringFSM.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/FSM/factoringFSM.scala 17:22]
  wire [2:0] _GEN_2 = io_timerDone ? 3'h3 : state; // @[src/main/scala/FSM/factoringFSM.scala 17:22 33:{25,32}]
  wire [2:0] _GEN_3 = io_timerDone ? 3'h4 : state; // @[src/main/scala/FSM/factoringFSM.scala 17:22 37:{25,32}]
  wire [2:0] _GEN_4 = io_timerDone ? 3'h5 : state; // @[src/main/scala/FSM/factoringFSM.scala 17:22 41:{25,32}]
  wire [2:0] _GEN_5 = io_timerDone ? 3'h0 : state; // @[src/main/scala/FSM/factoringFSM.scala 17:22 45:{25,32}]
  wire [2:0] _GEN_6 = 3'h5 == state ? _GEN_5 : state; // @[src/main/scala/FSM/factoringFSM.scala 23:16 17:22]
  wire [2:0] _GEN_7 = 3'h4 == state ? _GEN_4 : _GEN_6; // @[src/main/scala/FSM/factoringFSM.scala 23:16]
  wire [2:0] _GEN_8 = 3'h3 == state ? _GEN_3 : _GEN_7; // @[src/main/scala/FSM/factoringFSM.scala 23:16]
  wire  _io_light_T_2 = state == 3'h1 | state == 3'h3; // @[src/main/scala/FSM/factoringFSM.scala 50:33]
  wire  _io_light_T_3 = state == 3'h5; // @[src/main/scala/FSM/factoringFSM.scala 50:62]
  assign io_light = state == 3'h1 | state == 3'h3 | state == 3'h5; // @[src/main/scala/FSM/factoringFSM.scala 50:53]
  assign io_timerLoad = state != 3'h0; // @[src/main/scala/FSM/factoringFSM.scala 52:26]
  assign io_timerSelect = _io_light_T_2 | _io_light_T_3; // @[src/main/scala/FSM/factoringFSM.scala 51:59]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM/factoringFSM.scala 17:22]
      state <= 3'h0; // @[src/main/scala/FSM/factoringFSM.scala 17:22]
    end else if (3'h0 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 23:16]
      if (io_start) begin // @[src/main/scala/FSM/factoringFSM.scala 25:21]
        state <= 3'h1; // @[src/main/scala/FSM/factoringFSM.scala 25:28]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 23:16]
      if (io_timerDone) begin // @[src/main/scala/FSM/factoringFSM.scala 29:25]
        state <= 3'h2; // @[src/main/scala/FSM/factoringFSM.scala 29:32]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 23:16]
      state <= _GEN_2;
    end else begin
      state <= _GEN_8;
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
  state = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module timerFSM(
  input   clock,
  input   reset,
  input   io_timerLoad, // @[src/main/scala/FSM/factoringFSM.scala 60:14]
  input   io_timerSelect, // @[src/main/scala/FSM/factoringFSM.scala 60:14]
  output  io_timerDone // @[src/main/scala/FSM/factoringFSM.scala 60:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] timerReg; // @[src/main/scala/FSM/factoringFSM.scala 66:25]
  reg [1:0] state; // @[src/main/scala/FSM/factoringFSM.scala 70:22]
  wire [1:0] _timerReg_T = io_timerSelect ? 2'h2 : 2'h0; // @[src/main/scala/FSM/factoringFSM.scala 77:24]
  wire  _T_2 = timerReg == 4'h0; // @[src/main/scala/FSM/factoringFSM.scala 82:21]
  wire [3:0] _timerReg_T_2 = timerReg - 4'h1; // @[src/main/scala/FSM/factoringFSM.scala 85:30]
  assign io_timerDone = state == 2'h1 & _T_2; // @[src/main/scala/FSM/factoringFSM.scala 95:37]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM/factoringFSM.scala 66:25]
      timerReg <= 4'h0; // @[src/main/scala/FSM/factoringFSM.scala 66:25]
    end else if (2'h0 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 73:16]
      if (io_timerLoad) begin // @[src/main/scala/FSM/factoringFSM.scala 75:25]
        timerReg <= {{2'd0}, _timerReg_T}; // @[src/main/scala/FSM/factoringFSM.scala 77:18]
      end
    end else if (2'h1 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 73:16]
      if (!(timerReg == 4'h0)) begin // @[src/main/scala/FSM/factoringFSM.scala 82:29]
        timerReg <= _timerReg_T_2; // @[src/main/scala/FSM/factoringFSM.scala 85:18]
      end
    end
    if (reset) begin // @[src/main/scala/FSM/factoringFSM.scala 70:22]
      state <= 2'h0; // @[src/main/scala/FSM/factoringFSM.scala 70:22]
    end else if (2'h0 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 73:16]
      if (io_timerLoad) begin // @[src/main/scala/FSM/factoringFSM.scala 75:25]
        state <= 2'h1; // @[src/main/scala/FSM/factoringFSM.scala 76:15]
      end
    end else if (2'h1 == state) begin // @[src/main/scala/FSM/factoringFSM.scala 73:16]
      if (timerReg == 4'h0) begin // @[src/main/scala/FSM/factoringFSM.scala 82:29]
        state <= 2'h0; // @[src/main/scala/FSM/factoringFSM.scala 83:15]
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
  timerReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module factoringFSM(
  input   clock,
  input   reset,
  input   io_start, // @[src/main/scala/FSM/factoringFSM.scala 102:14]
  output  io_light // @[src/main/scala/FSM/factoringFSM.scala 102:14]
);
  wire  myMasterFSM_clock; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_reset; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_io_start; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_io_light; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_io_timerLoad; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_io_timerSelect; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myMasterFSM_io_timerDone; // @[src/main/scala/FSM/factoringFSM.scala 108:27]
  wire  myTimerFSM_clock; // @[src/main/scala/FSM/factoringFSM.scala 109:26]
  wire  myTimerFSM_reset; // @[src/main/scala/FSM/factoringFSM.scala 109:26]
  wire  myTimerFSM_io_timerLoad; // @[src/main/scala/FSM/factoringFSM.scala 109:26]
  wire  myTimerFSM_io_timerSelect; // @[src/main/scala/FSM/factoringFSM.scala 109:26]
  wire  myTimerFSM_io_timerDone; // @[src/main/scala/FSM/factoringFSM.scala 109:26]
  masterFSM myMasterFSM ( // @[src/main/scala/FSM/factoringFSM.scala 108:27]
    .clock(myMasterFSM_clock),
    .reset(myMasterFSM_reset),
    .io_start(myMasterFSM_io_start),
    .io_light(myMasterFSM_io_light),
    .io_timerLoad(myMasterFSM_io_timerLoad),
    .io_timerSelect(myMasterFSM_io_timerSelect),
    .io_timerDone(myMasterFSM_io_timerDone)
  );
  timerFSM myTimerFSM ( // @[src/main/scala/FSM/factoringFSM.scala 109:26]
    .clock(myTimerFSM_clock),
    .reset(myTimerFSM_reset),
    .io_timerLoad(myTimerFSM_io_timerLoad),
    .io_timerSelect(myTimerFSM_io_timerSelect),
    .io_timerDone(myTimerFSM_io_timerDone)
  );
  assign io_light = myMasterFSM_io_light; // @[src/main/scala/FSM/factoringFSM.scala 113:12]
  assign myMasterFSM_clock = clock;
  assign myMasterFSM_reset = reset;
  assign myMasterFSM_io_start = io_start; // @[src/main/scala/FSM/factoringFSM.scala 112:24]
  assign myMasterFSM_io_timerDone = myTimerFSM_io_timerDone; // @[src/main/scala/FSM/factoringFSM.scala 118:28]
  assign myTimerFSM_clock = clock;
  assign myTimerFSM_reset = reset;
  assign myTimerFSM_io_timerLoad = myMasterFSM_io_timerLoad; // @[src/main/scala/FSM/factoringFSM.scala 116:27]
  assign myTimerFSM_io_timerSelect = myMasterFSM_io_timerSelect; // @[src/main/scala/FSM/factoringFSM.scala 117:29]
endmodule
