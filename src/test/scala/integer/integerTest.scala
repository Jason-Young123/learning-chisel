import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import org.scalatest.Tag

//object integerTag extends Tag("integer")

class integerTest extends AnyFlatSpec with Matchers{
  "Integer Test" should "add" in {
    val i = 2
    val j = 3
    (i + j) should be (5)
  }
}
