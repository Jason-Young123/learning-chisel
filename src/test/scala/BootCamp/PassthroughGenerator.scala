package BootCamp // 保持 package 路径一致

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PassthroughGeneratorTest extends AnyFlatSpec with ChiselScalatestTester{ // 如果报错，可以直接写 object 运行
  // 刚才你提到的测试逻辑
  "PassthroughGenerator" should "correctly pass values" in {
    test(new PassthroughGenerator(10)) { c =>
      c.io.in.poke(0.U)
      c.io.out.expect(0.U)
      c.io.in.poke(512.U)
      c.io.out.expect(512.U)
    }
    // 只有进入了这个块，且测试运行，才会打印这行
    println("SUCCESS!!")
  }
}