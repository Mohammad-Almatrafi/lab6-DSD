module adder_fixedPoint #(
    parameter n1 = 4,
    n2 = 4,
    m1 = 4,
    m2 = 4
) (
    a,
    b,
    sum,
    co
);
  input [n1+m1-1:0] a;
  input [n2+m2-1:0] b;

  localparam maxn = (n1 > n2) ? n1 : n2;
  localparam maxm = (m1 > m2) ? m1 : m2;
  logic switch = m1 > m2;

  output logic [maxn+maxm-1:0] sum;
  output logic co;

  assign {co, sum} = switch ? (a + (b << (m1 - m2))) : (b + (a << (m2 - m1)));

endmodule



