//foo1: 组合逻辑定义与模块级联

import chisel3._
import chisel3.util._//与switch/is有关

class ALU extends Module {
  val io = IO(new Bundle{
    val a = Input(UInt(16.W))
    val b = Input(UInt(16.W))
    val sel = Input(UInt(2.W))//功能选择
    val out = Output(UInt(16.W))
  })

  io.out := 0.U//初始化
  switch(io.sel){
    is("b00".U) {io.out := io.a + io.b}//+
    is("b01".U) {io.out := io.a - io.b}//-
    is("b10".U) {io.out := io.a & io.b}//&
    is("b11".U) {io.out := io.a | io.b}//|
  }
}


class aux_module extends Module {
  val io = IO(new Bundle{
    val in = Input(UInt(16.W))
    val out = Output(UInt(8.W))
  })
  
  //功能实现:计数in中1的个数
  io.out := PopCount(io.in)

}


class foo1 extends Module {//ALU - aux级联
  val io = IO(new Bundle{
    val a = Input(UInt(16.W))
    val b = Input(UInt(16.W))
    val sel = Input(UInt(2.W))
    val out = Output(UInt(8.W))
  })

  //模块级联
  val myALU = Module(new ALU())
  val myaux = Module(new aux_module())

  //朴素互联,手动
  myALU.io.a := io.a//ALU.io.a由输入io.a驱动
  myALU.io.b := io.b//ALU.io.b由输入io.b驱动
  myALU.io.sel := io.sel//ALU.io.sel由输入io.sel驱动

  myaux.io.in := myALU.io.out//aux.io.in由ALU输出out驱动

  io.out := myaux.io.out//io.out由aux.io.out驱动
}


object foo1Gen extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(
    new foo1(), Array("--target-dir", "generated")
  )
}


