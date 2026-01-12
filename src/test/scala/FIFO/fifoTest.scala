import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random


class fifoTest extends AnyFlatSpec with ChiselScalatestTester{
  "fifoTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new fifoTop()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      //val rand = new Random(42)

      dut.io.deq1.ready.poke(1)
      dut.io.deq2.ready.poke(1)
      dut.io.enq1.valid.poke(1)
      dut.io.enq2.valid.poke(1)
      
      for(i <- 0 until 100){
        dut.io.enq1.bits.poke(i * 2)
        dut.io.enq2.bits.poke(i * 2)
        dut.clock.step(1)
      }
    }
  }
}

