module popCountFSM(
  input   clock,
  input   reset,
  input   io_dinValid, // @[src/main/scala/FSM/FSMD.scala 42:14]
  output  io_popCntValid, // @[src/main/scala/FSM/FSMD.scala 42:14]
  input   io_popCntReady, // @[src/main/scala/FSM/FSMD.scala 42:14]
  output  io_load, // @[src/main/scala/FSM/FSMD.scala 42:14]
  input   io_done // @[src/main/scala/FSM/FSMD.scala 42:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[src/main/scala/FSM/FSMD.scala 52:22]
  wire [1:0] _GEN_2 = io_popCntReady ? 2'h0 : state; // @[src/main/scala/FSM/FSMD.scala 68:27 69:15 52:22]
  assign io_popCntValid = state == 2'h2; // @[src/main/scala/FSM/FSMD.scala 75:28]
  assign io_load = io_dinValid; // @[src/main/scala/FSM/FSMD.scala 76:11]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM/FSMD.scala 52:22]
      state <= 2'h0; // @[src/main/scala/FSM/FSMD.scala 52:22]
    end else if (2'h0 == state) begin // @[src/main/scala/FSM/FSMD.scala 54:16]
      if (io_dinValid) begin // @[src/main/scala/FSM/FSMD.scala 56:24]
        state <= 2'h1; // @[src/main/scala/FSM/FSMD.scala 57:15]
      end
    end else if (2'h1 == state) begin // @[src/main/scala/FSM/FSMD.scala 54:16]
      if (io_done) begin // @[src/main/scala/FSM/FSMD.scala 62:20]
        state <= 2'h2; // @[src/main/scala/FSM/FSMD.scala 63:15]
      end
    end else if (2'h2 == state) begin // @[src/main/scala/FSM/FSMD.scala 54:16]
      state <= _GEN_2;
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module popCountDataPath(
  input        clock,
  input        reset,
  input  [7:0] io_din, // @[src/main/scala/FSM/FSMD.scala 8:14]
  input        io_load, // @[src/main/scala/FSM/FSMD.scala 8:14]
  output [3:0] io_popCnt, // @[src/main/scala/FSM/FSMD.scala 8:14]
  output       io_done // @[src/main/scala/FSM/FSMD.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] dataReg; // @[src/main/scala/FSM/FSMD.scala 15:24]
  reg [7:0] popCntReg; // @[src/main/scala/FSM/FSMD.scala 16:26]
  reg [3:0] counterReg; // @[src/main/scala/FSM/FSMD.scala 17:27]
  wire [7:0] _dataReg_T_1 = {1'h0,dataReg[7:1]}; // @[src/main/scala/FSM/FSMD.scala 20:18]
  wire [7:0] _GEN_4 = {{7'd0}, dataReg[0]}; // @[src/main/scala/FSM/FSMD.scala 21:26]
  wire [7:0] _popCntReg_T_2 = popCntReg + _GEN_4; // @[src/main/scala/FSM/FSMD.scala 21:26]
  wire  done = counterReg == 4'h0; // @[src/main/scala/FSM/FSMD.scala 23:26]
  wire [3:0] _counterReg_T_1 = counterReg - 4'h1; // @[src/main/scala/FSM/FSMD.scala 31:32]
  assign io_popCnt = popCntReg[3:0]; // @[src/main/scala/FSM/FSMD.scala 35:13]
  assign io_done = counterReg == 4'h0; // @[src/main/scala/FSM/FSMD.scala 23:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM/FSMD.scala 15:24]
      dataReg <= 8'h0; // @[src/main/scala/FSM/FSMD.scala 15:24]
    end else if (io_load) begin // @[src/main/scala/FSM/FSMD.scala 25:16]
      dataReg <= io_din; // @[src/main/scala/FSM/FSMD.scala 26:13]
    end else begin
      dataReg <= _dataReg_T_1; // @[src/main/scala/FSM/FSMD.scala 20:11]
    end
    if (reset) begin // @[src/main/scala/FSM/FSMD.scala 16:26]
      popCntReg <= 8'h0; // @[src/main/scala/FSM/FSMD.scala 16:26]
    end else if (io_load) begin // @[src/main/scala/FSM/FSMD.scala 25:16]
      popCntReg <= 8'h0; // @[src/main/scala/FSM/FSMD.scala 27:15]
    end else begin
      popCntReg <= _popCntReg_T_2; // @[src/main/scala/FSM/FSMD.scala 21:13]
    end
    if (reset) begin // @[src/main/scala/FSM/FSMD.scala 17:27]
      counterReg <= 4'h0; // @[src/main/scala/FSM/FSMD.scala 17:27]
    end else if (io_load) begin // @[src/main/scala/FSM/FSMD.scala 25:16]
      counterReg <= 4'h8; // @[src/main/scala/FSM/FSMD.scala 28:16]
    end else if (~done) begin // @[src/main/scala/FSM/FSMD.scala 30:16]
      counterReg <= _counterReg_T_1; // @[src/main/scala/FSM/FSMD.scala 31:18]
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
  dataReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  popCntReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  counterReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FSMD(
  input        clock,
  input        reset,
  input        io_dinValid, // @[src/main/scala/FSM/FSMD.scala 84:14]
  output       io_dinReady, // @[src/main/scala/FSM/FSMD.scala 84:14]
  input  [7:0] io_din, // @[src/main/scala/FSM/FSMD.scala 84:14]
  output       io_popCntValid, // @[src/main/scala/FSM/FSMD.scala 84:14]
  input        io_popCntReady, // @[src/main/scala/FSM/FSMD.scala 84:14]
  output [7:0] io_popCnt // @[src/main/scala/FSM/FSMD.scala 84:14]
);
  wire  main_fsm_clock; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_reset; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_io_dinValid; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_io_popCntValid; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_io_popCntReady; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_io_load; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  main_fsm_io_done; // @[src/main/scala/FSM/FSMD.scala 93:24]
  wire  data_fsm_clock; // @[src/main/scala/FSM/FSMD.scala 94:24]
  wire  data_fsm_reset; // @[src/main/scala/FSM/FSMD.scala 94:24]
  wire [7:0] data_fsm_io_din; // @[src/main/scala/FSM/FSMD.scala 94:24]
  wire  data_fsm_io_load; // @[src/main/scala/FSM/FSMD.scala 94:24]
  wire [3:0] data_fsm_io_popCnt; // @[src/main/scala/FSM/FSMD.scala 94:24]
  wire  data_fsm_io_done; // @[src/main/scala/FSM/FSMD.scala 94:24]
  popCountFSM main_fsm ( // @[src/main/scala/FSM/FSMD.scala 93:24]
    .clock(main_fsm_clock),
    .reset(main_fsm_reset),
    .io_dinValid(main_fsm_io_dinValid),
    .io_popCntValid(main_fsm_io_popCntValid),
    .io_popCntReady(main_fsm_io_popCntReady),
    .io_load(main_fsm_io_load),
    .io_done(main_fsm_io_done)
  );
  popCountDataPath data_fsm ( // @[src/main/scala/FSM/FSMD.scala 94:24]
    .clock(data_fsm_clock),
    .reset(data_fsm_reset),
    .io_din(data_fsm_io_din),
    .io_load(data_fsm_io_load),
    .io_popCnt(data_fsm_io_popCnt),
    .io_done(data_fsm_io_done)
  );
  assign io_dinReady = 1'h1; // @[src/main/scala/FSM/FSMD.scala 98:15]
  assign io_popCntValid = main_fsm_io_popCntValid; // @[src/main/scala/FSM/FSMD.scala 99:18]
  assign io_popCnt = {{4'd0}, data_fsm_io_popCnt}; // @[src/main/scala/FSM/FSMD.scala 104:13]
  assign main_fsm_clock = clock;
  assign main_fsm_reset = reset;
  assign main_fsm_io_dinValid = io_dinValid; // @[src/main/scala/FSM/FSMD.scala 97:24]
  assign main_fsm_io_popCntReady = io_popCntReady; // @[src/main/scala/FSM/FSMD.scala 100:27]
  assign main_fsm_io_done = data_fsm_io_done; // @[src/main/scala/FSM/FSMD.scala 108:20]
  assign data_fsm_clock = clock;
  assign data_fsm_reset = reset;
  assign data_fsm_io_din = io_din; // @[src/main/scala/FSM/FSMD.scala 103:19]
  assign data_fsm_io_load = main_fsm_io_load; // @[src/main/scala/FSM/FSMD.scala 107:20]
endmodule
