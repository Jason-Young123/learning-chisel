import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class memTest extends AnyFlatSpec with ChiselScalatestTester{
  "memTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new forwardingMem2).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      dut.io.raddr.poke(0x00)
      dut.io.waddr.poke(0x00)

      dut.io.wen.poke(true.B)
      dut.io.waddr.poke(0x010)
      dut.io.wdata.poke(0xab)
      dut.clock.step(1)
      
      dut.io.wen.poke(true.B)
      dut.io.waddr.poke(0x020)
      dut.io.wdata.poke(0xcd)
      dut.clock.step(1)
    
      dut.io.wen.poke(true.B)
      dut.io.waddr.poke(0x030)
      dut.io.wdata.poke(0xef)
      dut.clock.step(1)

      dut.io.wen.poke(false.B)
      dut.io.raddr.poke(0x010)
      //dut.io.waddr.poke(0x010)
      //dut.io.wdata.poke(0xab)
      dut.clock.step(1)

      //dut.io.wen.poke(true.B)
      //dut.io.waddr.poke(0x010)
      //dut.io.wdata.poke(0xab)
      dut.io.raddr.poke(0x020)
      dut.clock.step(1)

      //dut.io.wen.poke(true.B)
      //dut.io.waddr.poke(0x010)
      //dut.io.wdata.poke(0xab)
      dut.io.raddr.poke(0x030)
      dut.clock.step(1)

      dut.clock.step(3)

      //测试同步读写的临界情况
      dut.io.raddr.poke(0x40)
      dut.io.waddr.poke(0x40)
      dut.io.wdata.poke(0x89)
      dut.io.wen.poke(true.B)
      dut.clock.step(5)
    }
  }

}

