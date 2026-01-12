FIRRTL version 1.2.0
circuit param :
  module param :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sel : UInt<1>, out1 : UInt<4>, out2 : SInt<4>, out3 : UInt<10>} @[src/main/scala/Utils/param.scala 47:14]

    wire result1 : UInt @[src/main/scala/Utils/param.scala 36:23]
    result1 <= UInt<4>("ha") @[src/main/scala/Utils/param.scala 36:23]
    when io.sel : @[src/main/scala/Utils/param.scala 37:14]
      result1 <= UInt<3>("h5") @[src/main/scala/Utils/param.scala 38:11]
    io.out1 <= result1 @[src/main/scala/Utils/param.scala 59:11]
    node _result2_T = eq(io.sel, UInt<1>("h0")) @[src/main/scala/Utils/param.scala 62:23]
    wire result2 : SInt @[src/main/scala/Utils/param.scala 36:23]
    result2 <= asSInt(UInt<4>("h5")) @[src/main/scala/Utils/param.scala 36:23]
    when _result2_T : @[src/main/scala/Utils/param.scala 37:14]
      result2 <= asSInt(UInt<2>("h2")) @[src/main/scala/Utils/param.scala 38:11]
    io.out2 <= result2 @[src/main/scala/Utils/param.scala 63:11]
    wire tVal : { d : UInt<10>, b : UInt<1>} @[src/main/scala/Utils/param.scala 66:18]
    wire fVal : { d : UInt<10>, b : UInt<1>} @[src/main/scala/Utils/param.scala 67:18]
    tVal.b <= UInt<1>("h1") @[src/main/scala/Utils/param.scala 68:10]
    tVal.d <= UInt<4>("ha") @[src/main/scala/Utils/param.scala 69:10]
    fVal.b <= UInt<1>("h0") @[src/main/scala/Utils/param.scala 70:10]
    fVal.d <= UInt<4>("he") @[src/main/scala/Utils/param.scala 71:10]
    wire result3 : { d : UInt<10>, b : UInt<1>} @[src/main/scala/Utils/param.scala 36:23]
    result3 <= fVal @[src/main/scala/Utils/param.scala 36:23]
    when io.sel : @[src/main/scala/Utils/param.scala 37:14]
      result3 <= tVal @[src/main/scala/Utils/param.scala 38:11]
    io.out3 <= result3.d @[src/main/scala/Utils/param.scala 74:11]

