package BootCamp

import chisel3._
import chisel3.util._



class MyModule extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(4.W))
    val out = Output(UInt(4.W))
  })

  val two  = 1 + 1
  println(two)
  val utwo = 1.U + 1.U
  println(utwo)
  
  io.out := io.in
}