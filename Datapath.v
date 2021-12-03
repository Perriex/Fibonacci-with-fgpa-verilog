`timescale 1ns/1ns
module Datapath(clk, rst, cntup, pop, push, ins, modes, n, lt, empty, result);

input clk, rst, cntup, pop, push, ins, modes;
input [2:0] n;

output lt, empty;
output [4:0] result;

wire [3:0] dout, din;

Stack #(3) stack(clk, din, dout, push, pop, empty);

Alu alu(n, dout, ins, modes, din, lt);

Counter counter(clk, cntup, rst, result);

endmodule