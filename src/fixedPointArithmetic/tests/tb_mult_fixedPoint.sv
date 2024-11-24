module tb_mult_fixedPoint;
localparam n1 = 4, n2 = 2, m1 = 2, m2 = 4;

logic [n1+m1-1:0] a;
logic [n2+m2-1:0] b;
logic [n1+n2+m1+m2-1:0] out;


mult_fixedPoint #(.m1(m1),.m2(m2),.n1(n1),.n2(n2))  dut (.a(a),.b(b),.out(out)); 

initial 
    begin
        for(int i = 0; i < 2** (n1+n2+m1+m2);i++)begin
        {a,b} = i;
        #5;
        $display("%d ,%d ,%d, %d",a,b,out == a*b,out);
        
        end
        $finish;
    end



endmodule
