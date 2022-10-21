circuit Blinky :
  module Blinky :
    input clock : Clock
    input reset : UInt<1>
    output io : { led0 : UInt<1>}

    reg led : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[test.scala 9:20]
    reg counterWrap_value : UInt<9>, clock with :
      reset => (reset, UInt<9>("h0")) @[Counter.scala 62:40]
    wire counterWrap : UInt<1>
    counterWrap <= UInt<1>("h0")
    when UInt<1>("h1") : @[Counter.scala 120:16]
      node counterWrap_wrap_wrap = eq(counterWrap_value, UInt<9>("h1f3")) @[Counter.scala 74:24]
      node _counterWrap_wrap_value_T = add(counterWrap_value, UInt<1>("h1")) @[Counter.scala 78:24]
      node _counterWrap_wrap_value_T_1 = tail(_counterWrap_wrap_value_T, 1) @[Counter.scala 78:24]
      counterWrap_value <= _counterWrap_wrap_value_T_1 @[Counter.scala 78:15]
      when counterWrap_wrap_wrap : @[Counter.scala 88:20]
        counterWrap_value <= UInt<1>("h0") @[Counter.scala 88:28]
      counterWrap <= counterWrap_wrap_wrap @[Counter.scala 120:23]
    when counterWrap : @[test.scala 11:21]
      node _led_T = not(led) @[test.scala 12:12]
      led <= _led_T @[test.scala 12:9]
    io.led0 <= led @[test.scala 14:11]

