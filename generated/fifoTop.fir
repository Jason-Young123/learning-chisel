FIRRTL version 1.2.0
circuit fifoTop :
  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module Buffer_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 53:16]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 56:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 57:22]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 59:19]
    when _T : @[src/main/scala/FIFO/fifo.scala 59:29]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 60:25]
        stateReg <= UInt<1>("h1") @[src/main/scala/FIFO/fifo.scala 61:18]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 62:17]
    else :
      when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 65:25]
        stateReg <= UInt<1>("h0") @[src/main/scala/FIFO/fifo.scala 66:18]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 69:31]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/FIFO/fifo.scala 69:18]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/FIFO/fifo.scala 70:31]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/FIFO/fifo.scala 70:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 71:17]

  module BubbleFifo :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 40:14]

    inst Buffer of Buffer @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer.clock <= clock
    Buffer.reset <= reset
    inst Buffer_1 of Buffer_1 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    inst Buffer_2 of Buffer_2 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    inst Buffer_3 of Buffer_3 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    inst Buffer_4 of Buffer_4 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_4.clock <= clock
    Buffer_4.reset <= reset
    inst Buffer_5 of Buffer_5 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_5.clock <= clock
    Buffer_5.reset <= reset
    inst Buffer_6 of Buffer_6 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_6.clock <= clock
    Buffer_6.reset <= reset
    inst Buffer_7 of Buffer_7 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_7.clock <= clock
    Buffer_7.reset <= reset
    inst Buffer_8 of Buffer_8 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_8.clock <= clock
    Buffer_8.reset <= reset
    inst Buffer_9 of Buffer_9 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_9.clock <= clock
    Buffer_9.reset <= reset
    inst Buffer_10 of Buffer_10 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_10.clock <= clock
    Buffer_10.reset <= reset
    inst Buffer_11 of Buffer_11 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_11.clock <= clock
    Buffer_11.reset <= reset
    inst Buffer_12 of Buffer_12 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_12.clock <= clock
    Buffer_12.reset <= reset
    inst Buffer_13 of Buffer_13 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_13.clock <= clock
    Buffer_13.reset <= reset
    inst Buffer_14 of Buffer_14 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_14.clock <= clock
    Buffer_14.reset <= reset
    inst Buffer_15 of Buffer_15 @[src/main/scala/FIFO/fifo.scala 75:50]
    Buffer_15.clock <= clock
    Buffer_15.reset <= reset
    Buffer_1.io.enq <= Buffer.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_2.io.enq <= Buffer_1.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_3.io.enq <= Buffer_2.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_4.io.enq <= Buffer_3.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_5.io.enq <= Buffer_4.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_6.io.enq <= Buffer_5.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_7.io.enq <= Buffer_6.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_8.io.enq <= Buffer_7.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_9.io.enq <= Buffer_8.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_10.io.enq <= Buffer_9.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_11.io.enq <= Buffer_10.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_12.io.enq <= Buffer_11.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_13.io.enq <= Buffer_12.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_14.io.enq <= Buffer_13.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer_15.io.enq <= Buffer_14.io.deq @[src/main/scala/FIFO/fifo.scala 77:23]
    Buffer.io.enq <= io.enq @[src/main/scala/FIFO/fifo.scala 80:21]
    io.deq.bits <= Buffer_15.io.deq.bits @[src/main/scala/FIFO/fifo.scala 81:10]
    io.deq.valid <= Buffer_15.io.deq.valid @[src/main/scala/FIFO/fifo.scala 81:10]
    Buffer_15.io.deq.ready <= io.deq.ready @[src/main/scala/FIFO/fifo.scala 81:10]

  module DoubleBuffer :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBuffer_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 92:16]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 95:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/FIFO/fifo.scala 96:22]
    reg shadowReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/FIFO/fifo.scala 97:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
    when _T : @[src/main/scala/FIFO/fifo.scala 99:21]
      when io.enq.valid : @[src/main/scala/FIFO/fifo.scala 101:27]
        stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 102:20]
        dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 103:19]
    else :
      node _T_1 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
      when _T_1 : @[src/main/scala/FIFO/fifo.scala 99:21]
        node _T_2 = eq(io.enq.valid, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 108:30]
        node _T_3 = and(io.deq.ready, _T_2) @[src/main/scala/FIFO/fifo.scala 108:27]
        when _T_3 : @[src/main/scala/FIFO/fifo.scala 108:44]
          stateReg <= UInt<2>("h0") @[src/main/scala/FIFO/fifo.scala 109:20]
        node _T_4 = and(io.deq.ready, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 111:27]
        when _T_4 : @[src/main/scala/FIFO/fifo.scala 111:43]
          stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 112:20]
          dataReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 113:19]
        node _T_5 = eq(io.deq.ready, UInt<1>("h0")) @[src/main/scala/FIFO/fifo.scala 115:14]
        node _T_6 = and(_T_5, io.enq.valid) @[src/main/scala/FIFO/fifo.scala 115:28]
        when _T_6 : @[src/main/scala/FIFO/fifo.scala 115:44]
          stateReg <= UInt<2>("h2") @[src/main/scala/FIFO/fifo.scala 116:20]
          shadowReg <= io.enq.bits @[src/main/scala/FIFO/fifo.scala 117:21]
      else :
        node _T_7 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/FIFO/fifo.scala 99:21]
        when _T_7 : @[src/main/scala/FIFO/fifo.scala 99:21]
          when io.deq.ready : @[src/main/scala/FIFO/fifo.scala 122:27]
            dataReg <= shadowReg @[src/main/scala/FIFO/fifo.scala 123:19]
            stateReg <= UInt<2>("h1") @[src/main/scala/FIFO/fifo.scala 124:20]
    node _io_enq_ready_T = eq(stateReg, UInt<2>("h0")) @[src/main/scala/FIFO/fifo.scala 129:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 129:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/FIFO/fifo.scala 129:41]
    io.enq.ready <= _io_enq_ready_T_2 @[src/main/scala/FIFO/fifo.scala 129:18]
    node _io_deq_valid_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/FIFO/fifo.scala 130:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/FIFO/fifo.scala 130:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/FIFO/fifo.scala 130:39]
    io.deq.valid <= _io_deq_valid_T_2 @[src/main/scala/FIFO/fifo.scala 130:18]
    io.deq.bits <= dataReg @[src/main/scala/FIFO/fifo.scala 131:17]

  module DoubleBufferFifo :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 40:14]

    inst DoubleBuffer of DoubleBuffer @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer.clock <= clock
    DoubleBuffer.reset <= reset
    inst DoubleBuffer_1 of DoubleBuffer_1 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_1.clock <= clock
    DoubleBuffer_1.reset <= reset
    inst DoubleBuffer_2 of DoubleBuffer_2 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_2.clock <= clock
    DoubleBuffer_2.reset <= reset
    inst DoubleBuffer_3 of DoubleBuffer_3 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_3.clock <= clock
    DoubleBuffer_3.reset <= reset
    inst DoubleBuffer_4 of DoubleBuffer_4 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_4.clock <= clock
    DoubleBuffer_4.reset <= reset
    inst DoubleBuffer_5 of DoubleBuffer_5 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_5.clock <= clock
    DoubleBuffer_5.reset <= reset
    inst DoubleBuffer_6 of DoubleBuffer_6 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_6.clock <= clock
    DoubleBuffer_6.reset <= reset
    inst DoubleBuffer_7 of DoubleBuffer_7 @[src/main/scala/FIFO/fifo.scala 134:56]
    DoubleBuffer_7.clock <= clock
    DoubleBuffer_7.reset <= reset
    DoubleBuffer_1.io.enq <= DoubleBuffer.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_2.io.enq <= DoubleBuffer_1.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_3.io.enq <= DoubleBuffer_2.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_4.io.enq <= DoubleBuffer_3.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_5.io.enq <= DoubleBuffer_4.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_6.io.enq <= DoubleBuffer_5.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer_7.io.enq <= DoubleBuffer_6.io.deq @[src/main/scala/FIFO/fifo.scala 137:23]
    DoubleBuffer.io.enq <= io.enq @[src/main/scala/FIFO/fifo.scala 139:21]
    io.deq.bits <= DoubleBuffer_7.io.deq.bits @[src/main/scala/FIFO/fifo.scala 140:10]
    io.deq.valid <= DoubleBuffer_7.io.deq.valid @[src/main/scala/FIFO/fifo.scala 140:10]
    DoubleBuffer_7.io.deq.ready <= io.deq.ready @[src/main/scala/FIFO/fifo.scala 140:10]

  module fifoTop :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enq1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip enq2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/FIFO/fifo.scala 148:14]

    inst myfifo1 of BubbleFifo @[src/main/scala/FIFO/fifo.scala 155:23]
    myfifo1.clock <= clock
    myfifo1.reset <= reset
    inst myfifo2 of DoubleBufferFifo @[src/main/scala/FIFO/fifo.scala 156:23]
    myfifo2.clock <= clock
    myfifo2.reset <= reset
    myfifo1.io.enq <= io.enq1 @[src/main/scala/FIFO/fifo.scala 158:18]
    myfifo2.io.enq <= io.enq2 @[src/main/scala/FIFO/fifo.scala 159:18]
    io.deq1.bits <= myfifo1.io.deq.bits @[src/main/scala/FIFO/fifo.scala 160:11]
    io.deq1.valid <= myfifo1.io.deq.valid @[src/main/scala/FIFO/fifo.scala 160:11]
    myfifo1.io.deq.ready <= io.deq1.ready @[src/main/scala/FIFO/fifo.scala 160:11]
    io.deq2.bits <= myfifo2.io.deq.bits @[src/main/scala/FIFO/fifo.scala 161:11]
    io.deq2.valid <= myfifo2.io.deq.valid @[src/main/scala/FIFO/fifo.scala 161:11]
    myfifo2.io.deq.ready <= io.deq2.ready @[src/main/scala/FIFO/fifo.scala 161:11]

