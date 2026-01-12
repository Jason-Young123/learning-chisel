import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class mealyTest extends AnyFlatSpec with ChiselScalatestTester{
  "mealyTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new mealy()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      dut.io.din.poke(0)
      dut.clock.step(15)
      dut.io.din.poke(1)
      dut.clock.step(1)
      dut.io.din.poke(0)
      
      dut.clock.step(17)
      dut.io.din.poke(1)
      dut.clock.step(1)
      dut.io.din.poke(0)
      dut.clock.step(20)
    }
  }
}

