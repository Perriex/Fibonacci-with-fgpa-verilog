module Counter (clk, cntup, clr, res);

input clk, cntup, clr;

output [4:0] res;
wire [5:0] q;

genvar k;
generate for (k = 1; k <= 5; k = k + 1)
    STWO unit(q[k], 1'b1, q[k], 1'b0, cntup, q[k], cntup, q[k], clr, q[k - 1], q[k]);
endgenerate

assign q[0] = clk;

assign res = q[4:0];

endmodule