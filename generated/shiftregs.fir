FIRRTL version 1.2.0
circuit shiftregs :
  module shiftregs :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip serIn : UInt<1>, flip paraIn : UInt<4>, flip load : UInt<1>, out : UInt<4>} @[src/main/scala/Seq/shiftregs.scala 6:14]

    reg outReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/Seq/shiftregs.scala 13:23]
    when io.load : @[src/main/scala/Seq/shiftregs.scala 14:17]
      outReg <= io.paraIn @[src/main/scala/Seq/shiftregs.scala 15:12]
    else :
      node _outReg_T = bits(outReg, 2, 0) @[src/main/scala/Seq/shiftregs.scala 17:25]
      node _outReg_T_1 = cat(_outReg_T, io.serIn) @[src/main/scala/Seq/shiftregs.scala 17:18]
      outReg <= _outReg_T_1 @[src/main/scala/Seq/shiftregs.scala 17:12]
    io.out <= outReg @[src/main/scala/Seq/shiftregs.scala 20:10]

