import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class FSMDTest extends AnyFlatSpec with ChiselScalatestTester{
  "FSMDTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")){
      Seq(WriteVcdAnnotation)
    } else{
      Seq.empty
    }

    test (new FSMD()).withAnnotations(annotations){dut =>
      dut.clock.setTimeout(0)

      //复原状态
      dut.io.din.poke(0.U)
      dut.io.dinValid.poke(false.B)
      dut.io.popCntReady.poke(false.B)
      dut.clock.step(20)

      
      //数据传入
      dut.io.din.poke(0xa8.U)
      dut.io.dinValid.poke(true.B)
      dut.clock.step(1)
      dut.io.dinValid.poke(false.B)

      //等待计算
      dut.clock.step(50)

      //模拟下级接受数据
      dut.io.popCntReady.poke(true.B)
      dut.clock.step(1)
      dut.io.popCntReady.poke(false.B)
      dut.clock.step(10)


      //再传入一次,但下级不再取数据
      dut.io.din.poke(0xbc.U)
      dut.io.dinValid.poke(true.B)
      dut.clock.step(1)
      dut.io.dinValid.poke(false.B)
      dut.clock.step(100)

    }
  }
}

