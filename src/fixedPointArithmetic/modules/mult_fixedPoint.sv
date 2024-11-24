module mult_fixedPoint #(
    parameter n1 = 4,
    n2 = 4,
    m1 = 4,
    m2 = 4
) (
    a,
    b,
    out
);
  
  input [n1+m1-1:0] a;
  input [n2+m2-1:0] b;
  output [n1+n2+m2+m1-1:0] out;
  
  assign out = a*b;

endmodule