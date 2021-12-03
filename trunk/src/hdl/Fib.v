`timescale 1ns/1ns

module Fib (clk, start, CLR, n, result);

    input clk, start, CLR;
    input [2:0] n;
    output [4:0] result;

    wire lt, empty, pop, push, countUp, clr, ins, mode;
    Controller controller(clk, CLR, start, lt, empty, pop, push, countUp, clr, ins, mode);
    Datapath datapath(clk, clr, countUp, pop, push, ins, mode, n, lt, empty, result);

endmodule