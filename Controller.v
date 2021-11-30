`timescale 1ns/1ns
module Controller(clk, CLR,
                  start, lt, empty, 
                  pop, push, countUp, clr, ins, mode);

    input clk, CLR;
    input start, lt, empty;
    output pop, push, countUp, clr, ins, mode;

    parameter[1:0]  START = 0, CHECK = 1, PUSHFIRST = 3, PUSHSECOND = 2;

    reg [1:0] ps;
    wire compLt;

    CONE push_c1(.a0(start), .a1(0), .sa(ps[0]), .b0(1), .b1(1), .sb(ps[0]), .s0(ps[1]), .s1(ps[1]), .f(push));
    assign mode = push;

    CONE clr_c1(.a0(1), .a1(0), .sa(ps[0]), .b0(0), .b1(0), .sb(ps[0]), .s0(ps[1]), .s1(ps[1]), .f(clr));
    assign ins = clr;

    CONE countUp_c1(.a0(0), .a1(0), .sa(0), .b0(lt), .b1(0), .sb(empty), .s0(ps[1]), .s1(ps[0]), .f(countUp));
    
    CONE compLt_c1(.a0(1), .a1(1), .sa(0), .b0(0), .b1(0), .sb(0), .s0(lt), .s1(lt), .f(compLt));


    STWO ns1_s2(.d0(start), .d1(compLt), .d2(0), .d3(1), .a0(ps[1]), .a1(ps[1]), .b0(ps[0]), .b1(ps[0]), .CLR(CLR), .clk(clk), .out(ps[1]));

    STWO ns0_s2(.d0(start), .d1(0), .d2(1), .d3(empty), .a0(ps[1]), .a1(ps[1]), .b0(ps[0]), .b1(ps[0]), .CLR(CLR), .clk(clk), .out(ps[0]));

endmodule