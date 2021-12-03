`timescale 1ns/1ns

//START = 0, CHECK = 1, PUSHFIRST = 3, PUSHSECOND = 2;
module Controller(clk, CLR,
                  start, lt, empty, 
                  pop, push, countUp, clr, ins, mode);

    input clk, CLR;
    input start, lt, empty;
    output pop, push, countUp, clr, ins, mode;
    wire [1:0] ps;

    CONE push_c1(.a0(start), .a1(1'b0), .sa(ps[0]), .b0(1'b1), .b1(1'b1), .sb(ps[0]), .s0(ps[1]), .s1(ps[1]), .f(push));
    assign mode = push;

    CONE clr_c1(.a0(start), .a1(1'b0), .sa(ps[0]), .b0(1'b0), .b1(1'b0), .sb(ps[0]), .s0(ps[1]), .s1(ps[1]), .f(clr));
    assign ins = clr;

    CONE pop_c1(.a0(ps[0]), .a1(1'b0), .sa(lt), .b0(1'b0), .b1(1'b1), .sb(ps[0]), .s0(ps[1]), .s1(ps[1]), .f(pop));

    CONE countUp_c1(.a0(1'b0), .a1(empty), .sa(ps[0]), .b0(1'b0), .b1(1'b0), .sb(1'b0), .s0(ps[1]), .s1(lt), .f(countUp));

    STWO ns1_s2(.d0(1'b0), .d1(ps[0]), .d2(ps[0]), .d3(ps[0]), .a0(empty), .a1(ps[1]), .b0(lt), .b1(ps[1]), .CLR(CLR), .clk(clk), .out(ps[1]));

    STWO ns0_s2(.d0(start), .d1(1'b0), .d2(empty), .d3(1'b0), .a0(ps[1]), .a1(ps[1]), .b0(ps[0]), .b1(ps[0]), .CLR(CLR), .clk(clk), .out(ps[0]));

endmodule