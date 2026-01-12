import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random


class lutTest extends AnyFlatSpec with ChiselScalatestTester{
  "lutTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new lut()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      val rand = new Random(42)

      for(i <- 0 until 30){
        val addr = rand.nextInt(31)
        dut.clock.step(10)
        dut.io.address.poke(addr.U)
      }
    }
  }
}

