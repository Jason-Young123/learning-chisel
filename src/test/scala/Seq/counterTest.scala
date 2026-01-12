import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class counterTest extends AnyFlatSpec with ChiselScalatestTester{
  "counterTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }
  
    test (new counter).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      dut.io.en.poke(true.B)
      dut.io.dir.poke(false.B)
      dut.clock.step(10000)
    }
  }
}

