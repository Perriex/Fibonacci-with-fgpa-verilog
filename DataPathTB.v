`timescale 1ns/1ns

module DataPathTB ();
    
    reg clk = 0, rst = 0, cntup = 0, pop = 0, push = 0, ins = 0, modes = 0;
    reg [2:0] n = 3'b011;

    wire lt, empty;
    wire [4:0] result;

    Datapath UUT(clk, rst, cntup, pop, push, ins, modes, n, lt, empty, result);

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #20 rst = 0;
        ins = 1;
        push = 1;
        #10;
        ins = 0;
        push = 1;
        #10;
        cntup = 1;
        #20;
    end
endmodule