import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class factoringFSMTest extends AnyFlatSpec with ChiselScalatestTester{
  "factoringFSMTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new factoringFSM()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      dut.io.start.poke(0)
      dut.clock.step(15)

      dut.io.start.poke(1)
      dut.clock.step(1)
      dut.io.start.poke(0)
      dut.clock.step(300)

      dut.io.start.poke(1)
      dut.clock.step(1)
      dut.io.start.poke(0)
      dut.clock.step(300)
    }
  }
}

