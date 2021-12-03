`timescale 1ns/1ns

module CounterTb ();

reg cntup = 0, clk = 0, clr = 0;
wire [4:0] res; 

Counter UUT(clk, cntup, clr, res);


always #5 clk = ~clk;

initial begin
    
    clr = 1;
    #50 clr = 0;
    cntup = 1;
    #300;
end
    
endmodule