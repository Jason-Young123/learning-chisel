import chisel3._
import chisel3.util._


//WriteIO和ReadIO本质就是两个ready-valid interface
//write interface of fifo
class WriteIO(size: Int) extends Bundle{
  val write = Input(Bool())//外部写请求
  val din = Input(UInt(size.W))//外部写入数据
  val full = Output(Bool())//是否已满
}

//read interface of fifo
class ReadIO(size: Int) extends Bundle{
  val read = Input(Bool())//外部读请求
  val dout = Output(UInt(size.W))//读出数据
  val empty = Output(Bool())//是否为空
}


//可直接调用的ready-valid接口,以发送端视角来看
class DecoupledIO[T <: Data](gen:T) extends Bundle{
  val ready = Input(Bool())
  val valid = Output(Bool())
  val bits = Output(gen)
}


//fifo总接口,也就是一个普通的双向ready-valid接口
class FifoIO[T <: Data](private val gen:T) extends Bundle{
  val enq = Flipped(new DecoupledIO(gen))
  val deq = new DecoupledIO(gen)
}




//抽象类fifo
abstract class Fifo[T <: Data](gen:T, depth:Int) extends Module{
  val io = IO(new FifoIO(gen))
  assert(depth > 0, "depth should be positive")
}





//具体fifo1: bubble fifo
class BubbleFifo [T <: Data](gen:T, depth:Int) extends Fifo(gen:T, depth:Int){
  
  //step1: 构造辅助类Buffer,因为只有BubbleFifo会使用Buffer
  private class Buffer extends Module{
    val io = IO(new FifoIO(gen))
    
    val empty :: full :: Nil = Enum(2)
    val stateReg = RegInit(empty)
    val dataReg = Reg(gen)

    when(stateReg === empty){
      when(io.enq.valid){
        stateReg := full
        dataReg := io.enq.bits
      }
    } .otherwise{
      when(io.deq.ready){
        stateReg := empty
      }
    }
    io.enq.ready := (stateReg === empty)
    io.deq.valid := (stateReg === full)
    io.deq.bits := dataReg
  }

  //step2: 进行多级Bubblefifo建模
  private val buffers = Array.fill(depth){ Module(new Buffer()) }
  for(i <- 1 to depth - 1){
    buffers(i).io.enq <> buffers(i-1).io.deq//后一级buffer的输入由前一级buffer输出驱动
  }

  buffers(0).io.enq <> io.enq
  io.deq <> buffers(depth-1).io.deq

}




//具体fifo2: DoubleBufferFifo
class DoubleBufferFifo[T <: Data](gen:T, depth:Int) extends Fifo(gen:T, depth:Int){
  
  private class DoubleBuffer[T <: Data](gen:T) extends Module{
    val io = IO(new FifoIO(gen))

    val empty :: one :: two :: Nil = Enum(3)
    val stateReg = RegInit(empty)
    val dataReg = Reg(gen)
    val shadowReg = Reg(gen)

    switch(stateReg){
      is(empty){
        when(io.enq.valid){
          stateReg := one
          dataReg := io.enq.bits
        }
      }
      
      is(one){
        when(io.deq.ready && !io.enq.valid){//只出不进
          stateReg := empty
        }
        when(io.deq.ready && io.enq.valid){//既出又进,最优工作点,每个时钟周期可以满载运行
          stateReg := one//不动
          dataReg := io.enq.bits
        }
        when(!io.deq.ready && io.enq.valid){//只进不出
          stateReg := two
          shadowReg := io.enq.bits
        }
      }

      is(two){
        when(io.deq.ready){
          dataReg := shadowReg//先取dataReg,后取shadowReg
          stateReg := one
        }
      }
    }

    io.enq.ready := (stateReg === empty || stateReg === one)
    io.deq.valid := (stateReg === one || stateReg === two)
    io.deq.bits := dataReg
  }

  private val buffers = Array.fill((depth+1)/2){ Module(new DoubleBuffer(gen)) }

  for(i <- 1 to (depth+1)/2-1){
    buffers(i).io.enq <> buffers(i-1).io.deq
  }
  buffers(0).io.enq <> io.enq
  io.deq <> buffers((depth+1)/2-1).io.deq

}




class fifoTop extends Module{
  val io = IO(new Bundle{
    val enq1 = Flipped(new DecoupledIO(UInt(8.W)))
    val enq2 = Flipped(new DecoupledIO(UInt(8.W)))
    val deq1 = new DecoupledIO(UInt(8.W))//for fifo1
    val deq2 = new DecoupledIO(UInt(8.W))//for fifo2
  })
  
  val myfifo1 = Module(new BubbleFifo(UInt(8.W), 16))//深度为4的BubbleFifo,实际4级
  val myfifo2 = Module(new DoubleBufferFifo(UInt(8.W), 16))//深度为4的DoubleBufferFifo,实际2级

  myfifo1.io.enq <> io.enq1
  myfifo2.io.enq <> io.enq2
  io.deq1 <> myfifo1.io.deq
  io.deq2 <> myfifo2.io.deq

}




object fifoGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new fifoTop(), Array("--target-dir", "generated")
  )
}















