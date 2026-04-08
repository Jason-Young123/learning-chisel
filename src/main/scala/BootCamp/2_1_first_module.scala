package BootCamp

import chisel3._
import chisel3.util._


class PassthroughGenerator(width: Int) extends Module { 
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })
  io.out := io.in
}


object PassthroughGeneratorGen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new PassthroughGenerator(10), Array("--target-dir", "generated")
  )
}