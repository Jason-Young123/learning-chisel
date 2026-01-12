import chisel3._
import chisel3.util._


//1024(10 bit)寻址的mem建模
class mem extends Module {
  val io = IO(new Bundle{
    val raddr = Input(UInt(10.W))
    val rdata = Output(UInt(8.W))
    val wen = Input(Bool())
    val waddr = Input(UInt(10.W))
    val wdata = Input(UInt(8.W))
  })

  val mem = SyncReadMem(1024, UInt(8.W))
  
  io.rdata := mem.read(io.raddr)

  when(io.wen){
    mem.write(io.waddr, io.wdata)
  }
}


class forwardingMem1 extends Module{
  val io = IO(new Bundle{
    val raddr = Input(UInt(10.W))
    val rdata = Output(UInt(8.W))
    val wen = Input(Bool())
    val waddr = Input(UInt(10.W))
    val wdata = Input(UInt(8.W))
  })

  //用SyncReadMem建模Mem存在读延迟,常用于FPGA(仅支持同步读写,均受clk驱动)
  //用Mem建模不存在读延迟,可用于asic(支持异步读(assign)和同步写(受clk驱动))
  val fdmem = SyncReadMem(1024, UInt(8.W))
  
  val rdata = fdmem.read(io.raddr)

  when(io.wen){
    fdmem.write(io.waddr, io.wdata)
  }

  //注意这里由于when中信号都为wire,因此实际为用always @(*)描述的纯组合电路
  //从而导致io.wdata直接贯通到io.rdata(少了半个周期延迟)(但是rdata本身是reg
  //,因此不受影响)
  /*when(io.wen && io.raddr === io.waddr){
    io.rdata := io.wdata
  } .otherwise{
    io.rdata := rdata
  }*/
  //对于同步读写Mem必须这样写,以保持时序统一
  when(io.wen && io.raddr === io.waddr){
    io.rdata := RegNext(io.wdata)//手动引入延迟
  } .otherwise{
    io.rdata := rdata
  }
}




//功能完全等同于forwardingMem1
class forwardingMem2 extends Module{
  val io = IO(new Bundle{
    val raddr = Input(UInt(10.W))
    val rdata = Output(UInt(8.W))
    val wen = Input(Bool())
    val waddr = Input(UInt(10.W))
    val wdata = Input(UInt(8.W))
  })
  
  val fdmem = SyncReadMem(1024, UInt(8.W))
  
  val rdata = fdmem.read(io.raddr)

  when(io.wen){
    fdmem.write(io.waddr, io.wdata)
  }

  val wdataReg = RegNext(io.wdata)
  val doForwardReg = RegNext(io.waddr === io.raddr && io.wen)
  io.rdata := Mux(doForwardReg, wdataReg, rdata)

}



object memGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new mem(), Array("--target-dir", "generated")
  )
  
  (new chisel3.stage.ChiselStage).emitVerilog(
    new forwardingMem1(), Array("--target-dir", "generated")
  )
  
  (new chisel3.stage.ChiselStage).emitVerilog(
    new forwardingMem2(), Array("--target-dir", "generated")
  )
}
