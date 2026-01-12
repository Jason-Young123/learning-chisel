import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random


class inheritTest extends AnyFlatSpec with ChiselScalatestTester{
  "UpTickerTest 20" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new UpTicker(20)).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)
      
      //20个时钟周期后需要dut.io.tick === true.B
      dut.clock.step(20-1)
      dut.io.tick.expect(true.B)
    }
  }

  "DownTickerTest 30" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new DownTicker(30)).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      //30个时钟周期后需要dut.io.tick === true.B
      dut.clock.step(30-1)
      dut.io.tick.expect(true.B)
    }
  }

}

