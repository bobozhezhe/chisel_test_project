module Blinky(
  input   clock,
  input   reset,
  output  io_led0
);
  reg  led; // @[test.scala 9:20]
  reg [8:0] counterWrap_value; // @[Counter.scala 62:40]
  wire  counterWrap_wrap_wrap = counterWrap_value == 9'h1f3; // @[Counter.scala 74:24]
  wire [8:0] _counterWrap_wrap_value_T_1 = counterWrap_value + 9'h1; // @[Counter.scala 78:24]
  assign io_led0 = led; // @[test.scala 14:11]
  always @(posedge clock) begin
    if (reset) begin // @[test.scala 9:20]
      led <= 1'h0; // @[test.scala 9:20]
    end else if (counterWrap_wrap_wrap) begin // @[test.scala 11:21]
      led <= ~led; // @[test.scala 12:9]
    end
    if (reset) begin // @[Counter.scala 62:40]
      counterWrap_value <= 9'h0; // @[Counter.scala 62:40]
    end else if (counterWrap_wrap_wrap) begin // @[Counter.scala 88:20]
      counterWrap_value <= 9'h0; // @[Counter.scala 88:28]
    end else begin
      counterWrap_value <= _counterWrap_wrap_value_T_1; // @[Counter.scala 78:15]
    end
  end
endmodule
