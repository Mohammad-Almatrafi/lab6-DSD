module tb_FIR_filter;

  localparam m = 7, n = 3;

  logic clk = 0, rst_n, en;

  logic [m+n-1:0] x;
  logic [m*2+n*2-1:0] y;

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

    $finish;
  end





endmodule
