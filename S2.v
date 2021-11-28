`timescale 1ns/1ns

module STWO();
    
    input d0, d1, d2, d3, a0, a1, b0, b1, CLR, clk;
    output reg out;

    wire select;

    CTWO c2(   
        .d0(d0), .d1(d1), 
        .d2(d2), .d3(d3), 
        .a0(a0), .a1(a1), 
        .b0(b0), .b1(b1),
        select );
    
    always @(posedge clk) begin
        if (CLR == 1) begin
            out = 0;
        end
        else begin
            out = select;
        end
    end

endmodule