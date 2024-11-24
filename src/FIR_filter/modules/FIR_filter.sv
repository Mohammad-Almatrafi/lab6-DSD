`include "D_Register.sv"
`include "fixedPointArithmetic/modules/adder_fixedPoint.sv"
`include "fixedPointArithmetic/modules/mult_fixedPoint.sv"
module FIR_filter #(
    parameter n1 = 4,
    m2 = 4
) (
    clk,
    rst_n,
    en,
    x,
    y
);

  input clk, rst_n, en;
  input x;
  output y;
  logic xn_1, xn_2, xn_3, xn_4;

  D_Register #(
      .bits(8)
  ) RegisterN (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(x),
      .q(xn_1)
  );

  D_Register #(
      .bits(8)
  ) RegisterN_1 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn_1),
      .q(xn_2)
  );

  D_Register #(
      .bits(8)
  ) RegisterN_2 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn_2),
      .q(xn_3)
  );

  D_Register #(
      .bits(8)
  ) RegisterN_3 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(xn_3),
      .q(xn_4)
  );


    mult_fixedPoint #(.n1(4),.n2(4),.m1(4),.m2(4)) (.a(x),.b(),.out());



    adder_fixedPoint #() ();


endmodule
