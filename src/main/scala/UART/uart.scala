import chisel3._
import chisel3.util._


//并行接收接口
class Channel extends Bundle{
  val data = Input(Bits(8.W))
  val valid = Input(Bool())
  val ready = Output(Bool())
}


//单字节缓冲器,基于ready-valid接口进行数据接收/发送
class Buffer extends Module{
  val io = IO(new Bundle{
    val in = new Channel()
    val out = Flipped(new Channel())
  })

  val empty :: full :: Nil = Enum(2)
  val stateReg = RegInit(empty)
  val dataReg = RegInit(0.U(8.W))

  when(stateReg === empty){
    when(io.in.valid){
      dataReg := io.in.data
      stateReg := full
    }
  } .otherwise{
    when(io.out.ready){
      stateReg := empty
    }
  }

  io.in.ready := (stateReg === empty)
  io.out.valid := (stateReg === full)
  io.out.data := dataReg
}



//uart发送端: 接收并行数据data并串行发出,无缓冲
class UartTx(frequency:Int, baudRate:Int) extends Module{
  val io = IO(new Bundle{
    val channel = new Channel()
    val txd = Output(Bits(1.W))
  })

  //每隔多少clk cycle状态变化一次
  val CNT = ((frequency + baudRate / 2) / baudRate - 1).asUInt
  val cntReg = RegInit(0.U(32.W))

  //待发送的数据
  val shiftReg = RegInit(0x7ff.U)
  //已经发送多少bit
  val bitReg = RegInit(0.U(4.W))

  //外循环: cntReg在CNT~0之间循环计数
  //内循环: 计数已经发送了多少bit
  when(cntReg === 0.U){
    cntReg := CNT
    
    when(bitReg =/= 0.U){//循环发送数据直至bitReg = 0
      shiftReg := 1.U(1.W) ## shiftReg(10,1)//右移,发送LSB
      bitReg := bitReg - 1.U//待发送bit数 - 1
    } .otherwise{
      when(io.channel.valid){//接收并入数据
        shiftReg := 3.U(2.W) ## io.channel.data ## 0.U(1.W)//共2 + 8 + 1 = 11bit
        bitReg := 11.U
      } .otherwise{//无新数据
        shiftReg := 0x7ff.U
      }
    }
  } .otherwise{
    cntReg := cntReg - 1.U
  }

  //ready拉高时机:符合uart时钟且bitReg计数清零
  io.channel.ready := (cntReg === 0.U) && (bitReg === 0.U)
  
  io.txd := shiftReg(0)
}



//uart发送端,带一级缓冲
//为何Tx需要缓冲?
//  因为其接收快速传输的并行数据(并将其转化为慢速串行数据输出),因此输入端压力较大
class BufferedUartTx(freqency:Int, baudRate:Int) extends Module{
  val io = IO(new Bundle{
    val txd = Output(Bits(1.W))
    val channel = new Channel()
  })

  val buf = Module(new Buffer())
  val tx = Module(new UartTx(freqency, baudRate))

  //整体连接: io.channel -> buffer -> tx -> io.txd
  buf.io.in <> io.channel
  tx.io.channel <> buf.io.out
  io.txd <> tx.io.txd
}





//uart接收端,接收串行数据然后并行发出
//由于其输出端并行传输数据的速度远快于输入端串行传输,因此不需要buffer
class UartRx(frequency:Int, baudRate:Int) extends Module{
  val io = IO(new Bundle{
    val rxd = Input(Bits(1.W))
    val channel = Flipped(new Channel())
  })

  val CNT = ((frequency + baudRate / 2) / baudRate - 1).U
  val START_CNT = ((3 * frequency / 2 + baudRate / 2) / baudRate - 1).U

  //异步信号采样; rxdReg初始化为1
  val rxdReg = RegNext(RegNext(io.rxd, 1.U), 1.U)

  val shiftReg = RegInit('A'.U(8.W))
  val cntReg = RegInit(0.U(20.W))
  val bitReg = RegInit(0.U(4.W))
  val validReg = RegInit(false.B)//接收完毕信号


  when(cntReg =/= 0.U){
    cntReg := cntReg - 1.U
  } .otherwise{//判断uart行为
    
    when(bitReg =/= 0.U){//还没接收完毕
      cntReg := CNT
      shiftReg := rxdReg ## shiftReg(8,1)
      bitReg := bitReg - 1.U
      when(bitReg === 1.U){//最后1bit
        validReg := true.B
      }
    } .elsewhen(rxdReg === 0.U){//检测到start bit
      //由于uart时钟相较clk为慢始终,因此此时采样在start bit的下降沿;
      //为了准确采到 bit0的中间部分,需要等待1.5个uart始终周期
      cntReg := START_CNT
      bitReg := 8.U
    } .otherwise{
      //等待start bit
    }

  }

  when(validReg && io.channel.ready){//与下级握手成功
    validReg := false.B
  }

  io.channel.data := shiftReg
  io.channel.valid := validReg
}





















