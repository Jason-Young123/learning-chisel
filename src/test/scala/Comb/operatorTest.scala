import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class operatorTest extends AnyFlatSpec with ChiselScalatestTester{
  "operatorTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new example()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      dut.clock.step(1)
      dut.io.a.poke(-2.S)
      dut.io.b.poke(3.S)
      dut.clock.step(1)
      dut.io.a.poke(4.S)
      dut.io.b.poke(7.S)
      dut.clock.step(1)
      dut.io.a.poke(-6.S)
      dut.io.b.poke(-5.S)
      dut.clock.step(1)
      dut.io.a.poke(2.S)
      dut.io.b.poke(-3.S)
      dut.clock.step(1)
      dut.io.a.poke(7.S)
      dut.io.b.poke(7.S)
      dut.clock.step(1)
      dut.io.a.poke(-8.S)
      dut.io.b.poke(-8.S)
      dut.clock.step(5)
    }
  }
}


