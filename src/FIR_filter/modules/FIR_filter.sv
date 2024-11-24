// `include "D_Register.sv"
// `include "fixedPointArithmetic/modules/adder_fixedPoint.sv"
// `include "fixedPointArithmetic/modules/mult_fixedPoint.sv"
module FIR_filter #(
    parameter n = 4,
    m = 4
) (
    clk,
    rst_n,
    en,
    x,
    y
);

  input clk, rst_n, en;
  input [m+n-1:0] x;
  output [(2*m+2*n)-1:0] y;
  logic [m+n-1:0] xn[3:0];
  //   localparam m = 4;
  //   localparam n = 4;
  logic [(2*m+2*n)-1:0] mult[4:0];
  logic [(2*m+2*n)-1:0] sig[3:0];
  logic [m+n:0] h[4:0];
  assign h[0] = 10'h003;
  assign h[1] = 10'h001;
  assign h[2] = 10'h080;
  assign h[3] = 10'h001;
  assign h[4] = 10'h003;

  D_Register #(
      .bits(m + n)
  ) RegisterN (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(x),
      .q(xn[0])
  );

  D_Register #(
      .bits(m + n)
  ) RegisterN_1 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn[0]),
      .q(xn[1])
  );

  D_Register #(
      .bits(m + n)
  ) RegisterN_2 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn[1]),
      .q(xn[2])
  );

  D_Register #(
      .bits(m + n)
  ) RegisterN_3 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn[2]),
      .q(xn[3])
  );


  mult_fixedPoint #(
      .n1(n),
      .n2(n),
      .m1(m),
      .m2(m)
  ) mult1 (
      .a  (x),
      .b  (h[0]),
      .out(mult[0])
  );

  mult_fixedPoint #(
      .n1(n),
      .n2(n),
      .m1(m),
      .m2(m)
  ) mult2 (
      .a  (xn[0]),
      .b  (h[1]),
      .out(mult[1])
  );

  mult_fixedPoint #(
      .n1(n),
      .n2(n),
      .m1(m),
      .m2(m)
  ) mult3 (
      .a  (xn[1]),
      .b  (h[2]),
      .out(mult[2])
  );

  mult_fixedPoint #(
      .n1(n),
      .n2(n),
      .m1(m),
      .m2(m)
  ) mult4 (
      .a  (xn[2]),
      .b  (h[3]),
      .out(mult[3])
  );

  mult_fixedPoint #(
      .n1(n),
      .n2(n),
      .m1(m),
      .m2(m)
  ) mult5 (
      .a  (xn[3]),
      .b  (h[4]),
      .out(mult[4])
  );

  adder_fixedPoint #(
      .m1(2 * m),
      .m2(2 * m),
      .n1(2 * n),
      .n2(2 * n)
  ) add1 (
      .a  (mult[0]),
      .b  (mult[1]),
      .sum(sig[0])
  );

  adder_fixedPoint #(
      .m1(2 * m),
      .m2(2 * m),
      .n1(2 * n),
      .n2(2 * n)
  ) add2 (
      .a  (sig[0]),
      .b  (mult[2]),
      .sum(sig[1])
  );

  adder_fixedPoint #(
      .m1(2 * m),
      .m2(2 * m),
      .n1(2 * n),
      .n2(2 * n)
  ) add3 (
      .a  (sig[1]),
      .b  (mult[3]),
      .sum(sig[2])
  );

  adder_fixedPoint #(
      .m1(2 * m),
      .m2(2 * m),
      .n1(2 * n),
      .n2(2 * n)
  ) add4 (
      .a  (sig[2]),
      .b  (mult[4]),
      .sum(sig[3])
  );

  assign y = sig[3];

endmodule
