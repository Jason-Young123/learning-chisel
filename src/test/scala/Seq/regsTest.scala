import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec




class regsTest extends AnyFlatSpec with ChiselScalatestTester{
  "regsTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }
    
    test (new regs).withAnnotations(annotations) {dut =>
      dut.io.in.poke("b10101010".U)
      dut.io.en.poke(false.B)
      dut.clock.step(1)

      
      dut.io.in.poke("b01010101".U)
      dut.io.en.poke(false.B)
      dut.clock.step(1)


      dut.io.in.poke("b11011011".U)
      dut.io.en.poke(false.B)
      dut.clock.step(1)


      dut.io.in.poke("b01101101".U)
      dut.io.en.poke(true.B)
      dut.clock.step(1)


      dut.io.in.poke("b00111100".U)
      dut.io.en.poke(true.B)
      dut.clock.step(1)
    }
  }


  "regDelayTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new regDelay()).withAnnotations(annotations) {dut =>
      dut.io.a.poke(0)
      dut.clock.step(10)
      
      dut.io.a.poke(1)
      dut.clock.step(20)

      dut.io.a.poke(0)
      dut.clock.step(10)

      dut.io.a.poke(1)
      dut.clock.step(30)
    }
  }
}
