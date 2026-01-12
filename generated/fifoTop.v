module Buffer(
  input        clock,
  input        reset,
  output       io_enq_ready, // @[src/main/scala/FIFO/fifo.scala 53:16]
  input        io_enq_valid, // @[src/main/scala/FIFO/fifo.scala 53:16]
  input  [7:0] io_enq_bits, // @[src/main/scala/FIFO/fifo.scala 53:16]
  input        io_deq_ready, // @[src/main/scala/FIFO/fifo.scala 53:16]
  output       io_deq_valid, // @[src/main/scala/FIFO/fifo.scala 53:16]
  output [7:0] io_deq_bits // @[src/main/scala/FIFO/fifo.scala 53:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[src/main/scala/FIFO/fifo.scala 56:27]
  reg [7:0] dataReg; // @[src/main/scala/FIFO/fifo.scala 57:22]
  wire  _GEN_0 = io_enq_valid | stateReg; // @[src/main/scala/FIFO/fifo.scala 60:25 61:18 56:27]
  assign io_enq_ready = ~stateReg; // @[src/main/scala/FIFO/fifo.scala 69:31]
  assign io_deq_valid = stateReg; // @[src/main/scala/FIFO/fifo.scala 70:31]
  assign io_deq_bits = dataReg; // @[src/main/scala/FIFO/fifo.scala 71:17]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FIFO/fifo.scala 56:27]
      stateReg <= 1'h0; // @[src/main/scala/FIFO/fifo.scala 56:27]
    end else if (~stateReg) begin // @[src/main/scala/FIFO/fifo.scala 59:29]
      stateReg <= _GEN_0;
    end else if (io_deq_ready) begin // @[src/main/scala/FIFO/fifo.scala 65:25]
      stateReg <= 1'h0; // @[src/main/scala/FIFO/fifo.scala 66:18]
    end
    if (~stateReg) begin // @[src/main/scala/FIFO/fifo.scala 59:29]
      if (io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 60:25]
        dataReg <= io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 62:17]
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
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BubbleFifo(
  input        clock,
  input        reset,
  output       io_enq_ready, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input        io_enq_valid, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input  [7:0] io_enq_bits, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input        io_deq_ready, // @[src/main/scala/FIFO/fifo.scala 40:14]
  output       io_deq_valid, // @[src/main/scala/FIFO/fifo.scala 40:14]
  output [7:0] io_deq_bits // @[src/main/scala/FIFO/fifo.scala 40:14]
);
  wire  Buffer_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_1_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_2_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_3_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_3_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_3_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_4_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_4_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_4_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_5_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_5_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_5_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_6_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_6_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_6_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_7_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_7_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_7_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_8_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_8_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_8_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_9_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_9_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_9_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_10_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_10_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_10_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_11_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_11_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_11_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_12_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_12_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_12_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_13_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_13_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_13_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_14_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_14_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_14_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_clock; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_reset; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_15_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire  Buffer_15_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 75:50]
  wire [7:0] Buffer_15_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 75:50]
  Buffer Buffer ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_clock),
    .reset(Buffer_reset),
    .io_enq_ready(Buffer_io_enq_ready),
    .io_enq_valid(Buffer_io_enq_valid),
    .io_enq_bits(Buffer_io_enq_bits),
    .io_deq_ready(Buffer_io_deq_ready),
    .io_deq_valid(Buffer_io_deq_valid),
    .io_deq_bits(Buffer_io_deq_bits)
  );
  Buffer Buffer_1 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_1_clock),
    .reset(Buffer_1_reset),
    .io_enq_ready(Buffer_1_io_enq_ready),
    .io_enq_valid(Buffer_1_io_enq_valid),
    .io_enq_bits(Buffer_1_io_enq_bits),
    .io_deq_ready(Buffer_1_io_deq_ready),
    .io_deq_valid(Buffer_1_io_deq_valid),
    .io_deq_bits(Buffer_1_io_deq_bits)
  );
  Buffer Buffer_2 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_2_clock),
    .reset(Buffer_2_reset),
    .io_enq_ready(Buffer_2_io_enq_ready),
    .io_enq_valid(Buffer_2_io_enq_valid),
    .io_enq_bits(Buffer_2_io_enq_bits),
    .io_deq_ready(Buffer_2_io_deq_ready),
    .io_deq_valid(Buffer_2_io_deq_valid),
    .io_deq_bits(Buffer_2_io_deq_bits)
  );
  Buffer Buffer_3 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_3_clock),
    .reset(Buffer_3_reset),
    .io_enq_ready(Buffer_3_io_enq_ready),
    .io_enq_valid(Buffer_3_io_enq_valid),
    .io_enq_bits(Buffer_3_io_enq_bits),
    .io_deq_ready(Buffer_3_io_deq_ready),
    .io_deq_valid(Buffer_3_io_deq_valid),
    .io_deq_bits(Buffer_3_io_deq_bits)
  );
  Buffer Buffer_4 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_4_clock),
    .reset(Buffer_4_reset),
    .io_enq_ready(Buffer_4_io_enq_ready),
    .io_enq_valid(Buffer_4_io_enq_valid),
    .io_enq_bits(Buffer_4_io_enq_bits),
    .io_deq_ready(Buffer_4_io_deq_ready),
    .io_deq_valid(Buffer_4_io_deq_valid),
    .io_deq_bits(Buffer_4_io_deq_bits)
  );
  Buffer Buffer_5 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_5_clock),
    .reset(Buffer_5_reset),
    .io_enq_ready(Buffer_5_io_enq_ready),
    .io_enq_valid(Buffer_5_io_enq_valid),
    .io_enq_bits(Buffer_5_io_enq_bits),
    .io_deq_ready(Buffer_5_io_deq_ready),
    .io_deq_valid(Buffer_5_io_deq_valid),
    .io_deq_bits(Buffer_5_io_deq_bits)
  );
  Buffer Buffer_6 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_6_clock),
    .reset(Buffer_6_reset),
    .io_enq_ready(Buffer_6_io_enq_ready),
    .io_enq_valid(Buffer_6_io_enq_valid),
    .io_enq_bits(Buffer_6_io_enq_bits),
    .io_deq_ready(Buffer_6_io_deq_ready),
    .io_deq_valid(Buffer_6_io_deq_valid),
    .io_deq_bits(Buffer_6_io_deq_bits)
  );
  Buffer Buffer_7 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_7_clock),
    .reset(Buffer_7_reset),
    .io_enq_ready(Buffer_7_io_enq_ready),
    .io_enq_valid(Buffer_7_io_enq_valid),
    .io_enq_bits(Buffer_7_io_enq_bits),
    .io_deq_ready(Buffer_7_io_deq_ready),
    .io_deq_valid(Buffer_7_io_deq_valid),
    .io_deq_bits(Buffer_7_io_deq_bits)
  );
  Buffer Buffer_8 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_8_clock),
    .reset(Buffer_8_reset),
    .io_enq_ready(Buffer_8_io_enq_ready),
    .io_enq_valid(Buffer_8_io_enq_valid),
    .io_enq_bits(Buffer_8_io_enq_bits),
    .io_deq_ready(Buffer_8_io_deq_ready),
    .io_deq_valid(Buffer_8_io_deq_valid),
    .io_deq_bits(Buffer_8_io_deq_bits)
  );
  Buffer Buffer_9 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_9_clock),
    .reset(Buffer_9_reset),
    .io_enq_ready(Buffer_9_io_enq_ready),
    .io_enq_valid(Buffer_9_io_enq_valid),
    .io_enq_bits(Buffer_9_io_enq_bits),
    .io_deq_ready(Buffer_9_io_deq_ready),
    .io_deq_valid(Buffer_9_io_deq_valid),
    .io_deq_bits(Buffer_9_io_deq_bits)
  );
  Buffer Buffer_10 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_10_clock),
    .reset(Buffer_10_reset),
    .io_enq_ready(Buffer_10_io_enq_ready),
    .io_enq_valid(Buffer_10_io_enq_valid),
    .io_enq_bits(Buffer_10_io_enq_bits),
    .io_deq_ready(Buffer_10_io_deq_ready),
    .io_deq_valid(Buffer_10_io_deq_valid),
    .io_deq_bits(Buffer_10_io_deq_bits)
  );
  Buffer Buffer_11 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_11_clock),
    .reset(Buffer_11_reset),
    .io_enq_ready(Buffer_11_io_enq_ready),
    .io_enq_valid(Buffer_11_io_enq_valid),
    .io_enq_bits(Buffer_11_io_enq_bits),
    .io_deq_ready(Buffer_11_io_deq_ready),
    .io_deq_valid(Buffer_11_io_deq_valid),
    .io_deq_bits(Buffer_11_io_deq_bits)
  );
  Buffer Buffer_12 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_12_clock),
    .reset(Buffer_12_reset),
    .io_enq_ready(Buffer_12_io_enq_ready),
    .io_enq_valid(Buffer_12_io_enq_valid),
    .io_enq_bits(Buffer_12_io_enq_bits),
    .io_deq_ready(Buffer_12_io_deq_ready),
    .io_deq_valid(Buffer_12_io_deq_valid),
    .io_deq_bits(Buffer_12_io_deq_bits)
  );
  Buffer Buffer_13 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_13_clock),
    .reset(Buffer_13_reset),
    .io_enq_ready(Buffer_13_io_enq_ready),
    .io_enq_valid(Buffer_13_io_enq_valid),
    .io_enq_bits(Buffer_13_io_enq_bits),
    .io_deq_ready(Buffer_13_io_deq_ready),
    .io_deq_valid(Buffer_13_io_deq_valid),
    .io_deq_bits(Buffer_13_io_deq_bits)
  );
  Buffer Buffer_14 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_14_clock),
    .reset(Buffer_14_reset),
    .io_enq_ready(Buffer_14_io_enq_ready),
    .io_enq_valid(Buffer_14_io_enq_valid),
    .io_enq_bits(Buffer_14_io_enq_bits),
    .io_deq_ready(Buffer_14_io_deq_ready),
    .io_deq_valid(Buffer_14_io_deq_valid),
    .io_deq_bits(Buffer_14_io_deq_bits)
  );
  Buffer Buffer_15 ( // @[src/main/scala/FIFO/fifo.scala 75:50]
    .clock(Buffer_15_clock),
    .reset(Buffer_15_reset),
    .io_enq_ready(Buffer_15_io_enq_ready),
    .io_enq_valid(Buffer_15_io_enq_valid),
    .io_enq_bits(Buffer_15_io_enq_bits),
    .io_deq_ready(Buffer_15_io_deq_ready),
    .io_deq_valid(Buffer_15_io_deq_valid),
    .io_deq_bits(Buffer_15_io_deq_bits)
  );
  assign io_enq_ready = Buffer_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 80:21]
  assign io_deq_valid = Buffer_15_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 81:10]
  assign io_deq_bits = Buffer_15_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 81:10]
  assign Buffer_clock = clock;
  assign Buffer_reset = reset;
  assign Buffer_io_enq_valid = io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 80:21]
  assign Buffer_io_enq_bits = io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 80:21]
  assign Buffer_io_deq_ready = Buffer_1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_1_clock = clock;
  assign Buffer_1_reset = reset;
  assign Buffer_1_io_enq_valid = Buffer_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_1_io_enq_bits = Buffer_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_1_io_deq_ready = Buffer_2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_2_clock = clock;
  assign Buffer_2_reset = reset;
  assign Buffer_2_io_enq_valid = Buffer_1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_2_io_enq_bits = Buffer_1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_2_io_deq_ready = Buffer_3_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_3_clock = clock;
  assign Buffer_3_reset = reset;
  assign Buffer_3_io_enq_valid = Buffer_2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_3_io_enq_bits = Buffer_2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_3_io_deq_ready = Buffer_4_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_4_clock = clock;
  assign Buffer_4_reset = reset;
  assign Buffer_4_io_enq_valid = Buffer_3_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_4_io_enq_bits = Buffer_3_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_4_io_deq_ready = Buffer_5_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_5_clock = clock;
  assign Buffer_5_reset = reset;
  assign Buffer_5_io_enq_valid = Buffer_4_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_5_io_enq_bits = Buffer_4_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_5_io_deq_ready = Buffer_6_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_6_clock = clock;
  assign Buffer_6_reset = reset;
  assign Buffer_6_io_enq_valid = Buffer_5_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_6_io_enq_bits = Buffer_5_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_6_io_deq_ready = Buffer_7_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_7_clock = clock;
  assign Buffer_7_reset = reset;
  assign Buffer_7_io_enq_valid = Buffer_6_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_7_io_enq_bits = Buffer_6_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_7_io_deq_ready = Buffer_8_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_8_clock = clock;
  assign Buffer_8_reset = reset;
  assign Buffer_8_io_enq_valid = Buffer_7_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_8_io_enq_bits = Buffer_7_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_8_io_deq_ready = Buffer_9_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_9_clock = clock;
  assign Buffer_9_reset = reset;
  assign Buffer_9_io_enq_valid = Buffer_8_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_9_io_enq_bits = Buffer_8_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_9_io_deq_ready = Buffer_10_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_10_clock = clock;
  assign Buffer_10_reset = reset;
  assign Buffer_10_io_enq_valid = Buffer_9_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_10_io_enq_bits = Buffer_9_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_10_io_deq_ready = Buffer_11_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_11_clock = clock;
  assign Buffer_11_reset = reset;
  assign Buffer_11_io_enq_valid = Buffer_10_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_11_io_enq_bits = Buffer_10_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_11_io_deq_ready = Buffer_12_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_12_clock = clock;
  assign Buffer_12_reset = reset;
  assign Buffer_12_io_enq_valid = Buffer_11_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_12_io_enq_bits = Buffer_11_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_12_io_deq_ready = Buffer_13_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_13_clock = clock;
  assign Buffer_13_reset = reset;
  assign Buffer_13_io_enq_valid = Buffer_12_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_13_io_enq_bits = Buffer_12_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_13_io_deq_ready = Buffer_14_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_14_clock = clock;
  assign Buffer_14_reset = reset;
  assign Buffer_14_io_enq_valid = Buffer_13_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_14_io_enq_bits = Buffer_13_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_14_io_deq_ready = Buffer_15_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_15_clock = clock;
  assign Buffer_15_reset = reset;
  assign Buffer_15_io_enq_valid = Buffer_14_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_15_io_enq_bits = Buffer_14_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 77:23]
  assign Buffer_15_io_deq_ready = io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 81:10]
endmodule
module DoubleBuffer(
  input        clock,
  input        reset,
  output       io_enq_ready, // @[src/main/scala/FIFO/fifo.scala 92:16]
  input        io_enq_valid, // @[src/main/scala/FIFO/fifo.scala 92:16]
  input  [7:0] io_enq_bits, // @[src/main/scala/FIFO/fifo.scala 92:16]
  input        io_deq_ready, // @[src/main/scala/FIFO/fifo.scala 92:16]
  output       io_deq_valid, // @[src/main/scala/FIFO/fifo.scala 92:16]
  output [7:0] io_deq_bits // @[src/main/scala/FIFO/fifo.scala 92:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[src/main/scala/FIFO/fifo.scala 95:27]
  reg [7:0] dataReg; // @[src/main/scala/FIFO/fifo.scala 96:22]
  reg [7:0] shadowReg; // @[src/main/scala/FIFO/fifo.scala 97:24]
  wire [1:0] _GEN_2 = io_deq_ready & ~io_enq_valid ? 2'h0 : stateReg; // @[src/main/scala/FIFO/fifo.scala 108:44 109:20 95:27]
  wire [1:0] _GEN_3 = io_deq_ready & io_enq_valid ? 2'h1 : _GEN_2; // @[src/main/scala/FIFO/fifo.scala 111:43 112:20]
  wire [1:0] _GEN_8 = io_deq_ready ? 2'h1 : stateReg; // @[src/main/scala/FIFO/fifo.scala 122:27 124:20 95:27]
  wire  _io_enq_ready_T_1 = stateReg == 2'h1; // @[src/main/scala/FIFO/fifo.scala 129:53]
  assign io_enq_ready = stateReg == 2'h0 | stateReg == 2'h1; // @[src/main/scala/FIFO/fifo.scala 129:41]
  assign io_deq_valid = _io_enq_ready_T_1 | stateReg == 2'h2; // @[src/main/scala/FIFO/fifo.scala 130:39]
  assign io_deq_bits = dataReg; // @[src/main/scala/FIFO/fifo.scala 131:17]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FIFO/fifo.scala 95:27]
      stateReg <= 2'h0; // @[src/main/scala/FIFO/fifo.scala 95:27]
    end else if (2'h0 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= 2'h1; // @[src/main/scala/FIFO/fifo.scala 102:20]
      end
    end else if (2'h1 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (~io_deq_ready & io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 115:44]
        stateReg <= 2'h2; // @[src/main/scala/FIFO/fifo.scala 116:20]
      end else begin
        stateReg <= _GEN_3;
      end
    end else if (2'h2 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      stateReg <= _GEN_8;
    end
    if (2'h0 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 101:27]
        dataReg <= io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 103:19]
      end
    end else if (2'h1 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (io_deq_ready & io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 111:43]
        dataReg <= io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 113:19]
      end
    end else if (2'h2 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (io_deq_ready) begin // @[src/main/scala/FIFO/fifo.scala 122:27]
        dataReg <= shadowReg; // @[src/main/scala/FIFO/fifo.scala 123:19]
      end
    end
    if (!(2'h0 == stateReg)) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
      if (2'h1 == stateReg) begin // @[src/main/scala/FIFO/fifo.scala 99:21]
        if (~io_deq_ready & io_enq_valid) begin // @[src/main/scala/FIFO/fifo.scala 115:44]
          shadowReg <= io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 117:21]
        end
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
  stateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  shadowReg = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DoubleBufferFifo(
  input        clock,
  input        reset,
  output       io_enq_ready, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input        io_enq_valid, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input  [7:0] io_enq_bits, // @[src/main/scala/FIFO/fifo.scala 40:14]
  input        io_deq_ready, // @[src/main/scala/FIFO/fifo.scala 40:14]
  output       io_deq_valid, // @[src/main/scala/FIFO/fifo.scala 40:14]
  output [7:0] io_deq_bits // @[src/main/scala/FIFO/fifo.scala 40:14]
);
  wire  DoubleBuffer_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_1_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_2_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_3_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_3_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_3_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_4_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_4_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_4_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_5_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_5_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_5_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_6_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_6_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_6_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_clock; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_reset; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_7_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire  DoubleBuffer_7_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 134:56]
  wire [7:0] DoubleBuffer_7_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 134:56]
  DoubleBuffer DoubleBuffer ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_clock),
    .reset(DoubleBuffer_reset),
    .io_enq_ready(DoubleBuffer_io_enq_ready),
    .io_enq_valid(DoubleBuffer_io_enq_valid),
    .io_enq_bits(DoubleBuffer_io_enq_bits),
    .io_deq_ready(DoubleBuffer_io_deq_ready),
    .io_deq_valid(DoubleBuffer_io_deq_valid),
    .io_deq_bits(DoubleBuffer_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_1 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_1_clock),
    .reset(DoubleBuffer_1_reset),
    .io_enq_ready(DoubleBuffer_1_io_enq_ready),
    .io_enq_valid(DoubleBuffer_1_io_enq_valid),
    .io_enq_bits(DoubleBuffer_1_io_enq_bits),
    .io_deq_ready(DoubleBuffer_1_io_deq_ready),
    .io_deq_valid(DoubleBuffer_1_io_deq_valid),
    .io_deq_bits(DoubleBuffer_1_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_2 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_2_clock),
    .reset(DoubleBuffer_2_reset),
    .io_enq_ready(DoubleBuffer_2_io_enq_ready),
    .io_enq_valid(DoubleBuffer_2_io_enq_valid),
    .io_enq_bits(DoubleBuffer_2_io_enq_bits),
    .io_deq_ready(DoubleBuffer_2_io_deq_ready),
    .io_deq_valid(DoubleBuffer_2_io_deq_valid),
    .io_deq_bits(DoubleBuffer_2_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_3 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_3_clock),
    .reset(DoubleBuffer_3_reset),
    .io_enq_ready(DoubleBuffer_3_io_enq_ready),
    .io_enq_valid(DoubleBuffer_3_io_enq_valid),
    .io_enq_bits(DoubleBuffer_3_io_enq_bits),
    .io_deq_ready(DoubleBuffer_3_io_deq_ready),
    .io_deq_valid(DoubleBuffer_3_io_deq_valid),
    .io_deq_bits(DoubleBuffer_3_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_4 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_4_clock),
    .reset(DoubleBuffer_4_reset),
    .io_enq_ready(DoubleBuffer_4_io_enq_ready),
    .io_enq_valid(DoubleBuffer_4_io_enq_valid),
    .io_enq_bits(DoubleBuffer_4_io_enq_bits),
    .io_deq_ready(DoubleBuffer_4_io_deq_ready),
    .io_deq_valid(DoubleBuffer_4_io_deq_valid),
    .io_deq_bits(DoubleBuffer_4_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_5 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_5_clock),
    .reset(DoubleBuffer_5_reset),
    .io_enq_ready(DoubleBuffer_5_io_enq_ready),
    .io_enq_valid(DoubleBuffer_5_io_enq_valid),
    .io_enq_bits(DoubleBuffer_5_io_enq_bits),
    .io_deq_ready(DoubleBuffer_5_io_deq_ready),
    .io_deq_valid(DoubleBuffer_5_io_deq_valid),
    .io_deq_bits(DoubleBuffer_5_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_6 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_6_clock),
    .reset(DoubleBuffer_6_reset),
    .io_enq_ready(DoubleBuffer_6_io_enq_ready),
    .io_enq_valid(DoubleBuffer_6_io_enq_valid),
    .io_enq_bits(DoubleBuffer_6_io_enq_bits),
    .io_deq_ready(DoubleBuffer_6_io_deq_ready),
    .io_deq_valid(DoubleBuffer_6_io_deq_valid),
    .io_deq_bits(DoubleBuffer_6_io_deq_bits)
  );
  DoubleBuffer DoubleBuffer_7 ( // @[src/main/scala/FIFO/fifo.scala 134:56]
    .clock(DoubleBuffer_7_clock),
    .reset(DoubleBuffer_7_reset),
    .io_enq_ready(DoubleBuffer_7_io_enq_ready),
    .io_enq_valid(DoubleBuffer_7_io_enq_valid),
    .io_enq_bits(DoubleBuffer_7_io_enq_bits),
    .io_deq_ready(DoubleBuffer_7_io_deq_ready),
    .io_deq_valid(DoubleBuffer_7_io_deq_valid),
    .io_deq_bits(DoubleBuffer_7_io_deq_bits)
  );
  assign io_enq_ready = DoubleBuffer_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 139:21]
  assign io_deq_valid = DoubleBuffer_7_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 140:10]
  assign io_deq_bits = DoubleBuffer_7_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 140:10]
  assign DoubleBuffer_clock = clock;
  assign DoubleBuffer_reset = reset;
  assign DoubleBuffer_io_enq_valid = io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 139:21]
  assign DoubleBuffer_io_enq_bits = io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 139:21]
  assign DoubleBuffer_io_deq_ready = DoubleBuffer_1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_1_clock = clock;
  assign DoubleBuffer_1_reset = reset;
  assign DoubleBuffer_1_io_enq_valid = DoubleBuffer_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_1_io_enq_bits = DoubleBuffer_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_1_io_deq_ready = DoubleBuffer_2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_2_clock = clock;
  assign DoubleBuffer_2_reset = reset;
  assign DoubleBuffer_2_io_enq_valid = DoubleBuffer_1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_2_io_enq_bits = DoubleBuffer_1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_2_io_deq_ready = DoubleBuffer_3_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_3_clock = clock;
  assign DoubleBuffer_3_reset = reset;
  assign DoubleBuffer_3_io_enq_valid = DoubleBuffer_2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_3_io_enq_bits = DoubleBuffer_2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_3_io_deq_ready = DoubleBuffer_4_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_4_clock = clock;
  assign DoubleBuffer_4_reset = reset;
  assign DoubleBuffer_4_io_enq_valid = DoubleBuffer_3_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_4_io_enq_bits = DoubleBuffer_3_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_4_io_deq_ready = DoubleBuffer_5_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_5_clock = clock;
  assign DoubleBuffer_5_reset = reset;
  assign DoubleBuffer_5_io_enq_valid = DoubleBuffer_4_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_5_io_enq_bits = DoubleBuffer_4_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_5_io_deq_ready = DoubleBuffer_6_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_6_clock = clock;
  assign DoubleBuffer_6_reset = reset;
  assign DoubleBuffer_6_io_enq_valid = DoubleBuffer_5_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_6_io_enq_bits = DoubleBuffer_5_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_6_io_deq_ready = DoubleBuffer_7_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_7_clock = clock;
  assign DoubleBuffer_7_reset = reset;
  assign DoubleBuffer_7_io_enq_valid = DoubleBuffer_6_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_7_io_enq_bits = DoubleBuffer_6_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 137:23]
  assign DoubleBuffer_7_io_deq_ready = io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 140:10]
endmodule
module fifoTop(
  input        clock,
  input        reset,
  output       io_enq1_ready, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input        io_enq1_valid, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input  [7:0] io_enq1_bits, // @[src/main/scala/FIFO/fifo.scala 148:14]
  output       io_enq2_ready, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input        io_enq2_valid, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input  [7:0] io_enq2_bits, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input        io_deq1_ready, // @[src/main/scala/FIFO/fifo.scala 148:14]
  output       io_deq1_valid, // @[src/main/scala/FIFO/fifo.scala 148:14]
  output [7:0] io_deq1_bits, // @[src/main/scala/FIFO/fifo.scala 148:14]
  input        io_deq2_ready, // @[src/main/scala/FIFO/fifo.scala 148:14]
  output       io_deq2_valid, // @[src/main/scala/FIFO/fifo.scala 148:14]
  output [7:0] io_deq2_bits // @[src/main/scala/FIFO/fifo.scala 148:14]
);
  wire  myfifo1_clock; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo1_reset; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo1_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire [7:0] myfifo1_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo1_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire [7:0] myfifo1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 155:23]
  wire  myfifo2_clock; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire  myfifo2_reset; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire  myfifo2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire  myfifo2_io_enq_valid; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire [7:0] myfifo2_io_enq_bits; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire  myfifo2_io_deq_ready; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire  myfifo2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 156:23]
  wire [7:0] myfifo2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 156:23]
  BubbleFifo myfifo1 ( // @[src/main/scala/FIFO/fifo.scala 155:23]
    .clock(myfifo1_clock),
    .reset(myfifo1_reset),
    .io_enq_ready(myfifo1_io_enq_ready),
    .io_enq_valid(myfifo1_io_enq_valid),
    .io_enq_bits(myfifo1_io_enq_bits),
    .io_deq_ready(myfifo1_io_deq_ready),
    .io_deq_valid(myfifo1_io_deq_valid),
    .io_deq_bits(myfifo1_io_deq_bits)
  );
  DoubleBufferFifo myfifo2 ( // @[src/main/scala/FIFO/fifo.scala 156:23]
    .clock(myfifo2_clock),
    .reset(myfifo2_reset),
    .io_enq_ready(myfifo2_io_enq_ready),
    .io_enq_valid(myfifo2_io_enq_valid),
    .io_enq_bits(myfifo2_io_enq_bits),
    .io_deq_ready(myfifo2_io_deq_ready),
    .io_deq_valid(myfifo2_io_deq_valid),
    .io_deq_bits(myfifo2_io_deq_bits)
  );
  assign io_enq1_ready = myfifo1_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 158:18]
  assign io_enq2_ready = myfifo2_io_enq_ready; // @[src/main/scala/FIFO/fifo.scala 159:18]
  assign io_deq1_valid = myfifo1_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 160:11]
  assign io_deq1_bits = myfifo1_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 160:11]
  assign io_deq2_valid = myfifo2_io_deq_valid; // @[src/main/scala/FIFO/fifo.scala 161:11]
  assign io_deq2_bits = myfifo2_io_deq_bits; // @[src/main/scala/FIFO/fifo.scala 161:11]
  assign myfifo1_clock = clock;
  assign myfifo1_reset = reset;
  assign myfifo1_io_enq_valid = io_enq1_valid; // @[src/main/scala/FIFO/fifo.scala 158:18]
  assign myfifo1_io_enq_bits = io_enq1_bits; // @[src/main/scala/FIFO/fifo.scala 158:18]
  assign myfifo1_io_deq_ready = io_deq1_ready; // @[src/main/scala/FIFO/fifo.scala 160:11]
  assign myfifo2_clock = clock;
  assign myfifo2_reset = reset;
  assign myfifo2_io_enq_valid = io_enq2_valid; // @[src/main/scala/FIFO/fifo.scala 159:18]
  assign myfifo2_io_enq_bits = io_enq2_bits; // @[src/main/scala/FIFO/fifo.scala 159:18]
  assign myfifo2_io_deq_ready = io_deq2_ready; // @[src/main/scala/FIFO/fifo.scala 161:11]
endmodule
