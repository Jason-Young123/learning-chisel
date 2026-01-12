module mem(
  input        clock,
  input        reset,
  input  [9:0] io_raddr, // @[src/main/scala/Seq/mem.scala 7:14]
  output [7:0] io_rdata, // @[src/main/scala/Seq/mem.scala 7:14]
  input        io_wen, // @[src/main/scala/Seq/mem.scala 7:14]
  input  [9:0] io_waddr, // @[src/main/scala/Seq/mem.scala 7:14]
  input  [7:0] io_wdata // @[src/main/scala/Seq/mem.scala 7:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:1023]; // @[src/main/scala/Seq/mem.scala 15:24]
  wire  mem_io_rdata_MPORT_en; // @[src/main/scala/Seq/mem.scala 15:24]
  wire [9:0] mem_io_rdata_MPORT_addr; // @[src/main/scala/Seq/mem.scala 15:24]
  wire [7:0] mem_io_rdata_MPORT_data; // @[src/main/scala/Seq/mem.scala 15:24]
  wire [7:0] mem_MPORT_data; // @[src/main/scala/Seq/mem.scala 15:24]
  wire [9:0] mem_MPORT_addr; // @[src/main/scala/Seq/mem.scala 15:24]
  wire  mem_MPORT_mask; // @[src/main/scala/Seq/mem.scala 15:24]
  wire  mem_MPORT_en; // @[src/main/scala/Seq/mem.scala 15:24]
  reg  mem_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_en = mem_io_rdata_MPORT_en_pipe_0;
  assign mem_io_rdata_MPORT_addr = mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_data = mem[mem_io_rdata_MPORT_addr]; // @[src/main/scala/Seq/mem.scala 15:24]
  assign mem_MPORT_data = io_wdata;
  assign mem_MPORT_addr = io_waddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wen;
  assign io_rdata = mem_io_rdata_MPORT_data; // @[src/main/scala/Seq/mem.scala 17:12]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[src/main/scala/Seq/mem.scala 15:24]
    end
    mem_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_rdata_MPORT_addr_pipe_0 <= io_raddr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
