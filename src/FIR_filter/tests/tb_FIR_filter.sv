module tb_FIR_filter;

  localparam m = 7, n = 3;

  logic clk = 0, rst_n, en;

  logic [m+n-1:0] x;
  logic [m*2+n*2-1:0] y;
  logic [m+n-1:0] h[4:0];
  logic [m+n-1:0] xn[3:0];
  logic check;

  assign h[0]  = DUT.h[0];
  assign h[1]  = DUT.h[1];
  assign h[2]  = DUT.h[2];
  assign h[3]  = DUT.h[3];
  assign h[4]  = DUT.h[4];
  assign xn[0] = DUT.xn[0];
  assign xn[1] = DUT.xn[1];
  assign xn[2] = DUT.xn[2];
  assign xn[3] = DUT.xn[3];
  assign xn[4] = DUT.xn[4];


  assign check = (y == (x * h[0] + xn[0] * h[1] + xn[1] * h[2] + xn[2] * h[3] + xn[3] * h[4]));

  FIR_filter #(
      .n(n),
      .m(m)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .x(x),
      .y(y)
  );

  always #5 clk = ~clk;
  initial begin
    x = {3'd0, 7'h70};
    en = 1;
    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;


    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};
    @(negedge clk);
    x = {3'd0, 7'h70};

    $display("%d", check);

    $finish;
  end





endmodule
