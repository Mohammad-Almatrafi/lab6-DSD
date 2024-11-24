module tb_fixedPointAddition;

  localparam n1 = 3, n2 = 4, m1 = 5, m2 = 3;

  localparam maxn = (n1 > n2) ? n1 : n2;

  localparam maxm = (m1 > m2) ? m1 : m2;

  logic [n1+m1-1:0] a;

  logic [n2+m2-1:0] b;
  logic [maxm+maxn-1:0] sum;
  logic co;


  adder_fixedPoint #(
      .n1(n1),
      .n2(n2),
      .m1(m1),
      .m2(m2)
  ) DUT (
      .a  (a),
      .b  (b),
      .sum(sum),
      .co (co)
  );


  initial begin
    $display("a,\tb,\ts,\tc,\tcheck,\tactual");
    for (int i = 0; i < 2 ** (n1 + n2 + m1 + m2); i++) begin
      {a, b} = i;
      #5;
      $display("%d,\t%d,\t%d,\t%d,\t%b,\t%d",a, b, sum, co, sum == a + {b, 2'b00}, a + {b, 2'b00});
    end

  end





endmodule
