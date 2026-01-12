import chisel3._
import chisel3.util._



class moore extends Module{
  val io = IO(new Bundle{
    val badEvent = Input(Bool())
    val clear = Input(Bool())
    val ringBell = Output(Bool())
  })

  val green :: orange :: red :: Nil = Enum(3)
  //如果想用独热码(用寄存器面积增加换取组合逻辑面积减小)
  //val green = "b001".U(3.W)
  //val orange = "b010".U(3.W)
  //val red = "b100".U(3.W)

  val stateReg = RegInit(green)


  //不同于mealy,这里的switch语句是纯时序逻辑,理解更清晰
  switch (stateReg){
    is(green){
      when(io.badEvent){
        stateReg := orange
      }
    }
    is(orange){
      when(io.badEvent){
        stateReg := red
      } .elsewhen(io.clear){
        stateReg := green
      }
    }
    is(red){
      when(io.clear){
        stateReg := green
      }
    }
  }

  io.ringBell := (stateReg === red)
}




object mooreGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new moore(), Array("--target-dir", "generated")
  )

}
