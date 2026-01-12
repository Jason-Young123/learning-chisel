module forwardingMem2(
  input        clock,
  input        reset,
  input  [9:0] io_raddr, // @[src/main/scala/Seq/mem.scala 65:14]
  output [7:0] io_rdata, // @[src/main/scala/Seq/mem.scala 65:14]
  input        io_wen, // @[src/main/scala/Seq/mem.scala 65:14]
  input  [9:0] io_waddr, // @[src/main/scala/Seq/mem.scala 65:14]
  input  [7:0] io_wdata // @[src/main/scala/Seq/mem.scala 65:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] fdmem [0:1023]; // @[src/main/scala/Seq/mem.scala 73:26]
  wire  fdmem_rdata_en; // @[src/main/scala/Seq/mem.scala 73:26]
  wire [9:0] fdmem_rdata_addr; // @[src/main/scala/Seq/mem.scala 73:26]
  wire [7:0] fdmem_rdata_data; // @[src/main/scala/Seq/mem.scala 73:26]
  wire [7:0] fdmem_MPORT_data; // @[src/main/scala/Seq/mem.scala 73:26]
  wire [9:0] fdmem_MPORT_addr; // @[src/main/scala/Seq/mem.scala 73:26]
  wire  fdmem_MPORT_mask; // @[src/main/scala/Seq/mem.scala 73:26]
  wire  fdmem_MPORT_en; // @[src/main/scala/Seq/mem.scala 73:26]
  reg  fdmem_rdata_en_pipe_0;
  reg [9:0] fdmem_rdata_addr_pipe_0;
  reg [7:0] wdataReg; // @[src/main/scala/Seq/mem.scala 81:25]
  reg  doForwardReg; // @[src/main/scala/Seq/mem.scala 82:29]
  assign fdmem_rdata_en = fdmem_rdata_en_pipe_0;
  assign fdmem_rdata_addr = fdmem_rdata_addr_pipe_0;
  assign fdmem_rdata_data = fdmem[fdmem_rdata_addr]; // @[src/main/scala/Seq/mem.scala 73:26]
  assign fdmem_MPORT_data = io_wdata;
  assign fdmem_MPORT_addr = io_waddr;
  assign fdmem_MPORT_mask = 1'h1;
  assign fdmem_MPORT_en = io_wen;
  assign io_rdata = doForwardReg ? wdataReg : fdmem_rdata_data; // @[src/main/scala/Seq/mem.scala 83:18]
  always @(posedge clock) begin
    if (fdmem_MPORT_en & fdmem_MPORT_mask) begin
      fdmem[fdmem_MPORT_addr] <= fdmem_MPORT_data; // @[src/main/scala/Seq/mem.scala 73:26]
    end
    fdmem_rdata_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      fdmem_rdata_addr_pipe_0 <= io_raddr;
    end
    wdataReg <= io_wdata; // @[src/main/scala/Seq/mem.scala 81:25]
    doForwardReg <= io_waddr == io_raddr & io_wen; // @[src/main/scala/Seq/mem.scala 82:52]
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
    fdmem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  fdmem_rdata_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  fdmem_rdata_addr_pipe_0 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  wdataReg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  doForwardReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
