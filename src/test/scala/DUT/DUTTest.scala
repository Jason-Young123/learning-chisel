//import chisel
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.Tag


//以下在最新版本中均不再支持
//poke(dut.io.a, 3.U)
//step(1)
//expect(dut.io.out, 1)


//object DUTTag extends Tag("DUT")

//定义testbench
class DUTTest extends AnyFlatSpec with ChiselScalatestTester{
  //"DUTTest" should "pass" taggedAs(DUTTag) in{
  "DUTTest" should "pass" in{
    val annotations = if(sys.env.get("WAVEGEN").contains("true")) {
      Seq(WriteVcdAnnotation)//目前只导出vcd格式
    } else {
      Seq.empty
    }

    test(new DUT).withAnnotations(annotations) { dut =>
      
      //print调试法
      dut.io.a.poke(0.U)      // poke → poke (方法相同)
      dut.io.b.poke(1.U)
      dut.clock.step(1)       // step(1) → dut.clock.step(1)
      //val result1 = dut.io.out.peek().toString  // peek → peek()
      //println(s"Result is: $result1")
      println("Result is: " + dut.io.out.peek().toString)

      
      dut.io.a.poke(2.U)
      dut.io.b.poke(3.U)
      dut.clock.step(1)
      //val result2 = dut.io.out.peek().toString
      //println(s"Result is: $result2")
      println("Result is: " + dut.io.out.peek().toString)
      
      //expect调试法
      dut.io.a.poke(3.U)
      dut.io.b.poke(1.U)
      dut.clock.step(1)
      dut.io.out.expect(1.U)

      
      //循环测试
      for(a <- 0 until 4){
        for(b <- 0 until 4){
          dut.io.a.poke(a)
          dut.io.b.poke(b)
          dut.clock.step()
        }
      }

    }
  }
}



class DUTTestWave extends AnyFlatSpec with ChiselScalatestTester{
  "DUTTestWave" should "pass and REC wave" in{
    test(new DUT).withAnnotations(Seq(
      WriteVcdAnnotation,
      WriteFstAnnotation
    )){ dut =>
        for(cycle <- 0 until 20){
          val a = if(cycle % 3 == 0) 3.U else 0.U
          val b = if(cycle % 4 == 0) 2.U else 1.U
          dut.io.a.poke(a)
          dut.io.b.poke(b)
          dut.clock.step(1)
        }
      }
  }
}



