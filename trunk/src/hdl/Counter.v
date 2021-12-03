module Counter (clk, cntup, clr, res);

input clk, cntup, clr;

output [4:0] res;
wire [4:0] A0;
wire [4:0] B0;

genvar k;
generate for (k = 0; k <= 4; k = k + 1)
    STWO unit(res[k], 1'b1, res[k], 1'b0, A0[k], res[k], B0[k], res[k], clr, clk, res[k]);
endgenerate

wire q0q1cntup_w, q2q3_w;
CONE q0q1cntup(1'b0, 1'b0, 1'b0, 1'b0, res[1], res[0], cntup, cntup, q0q1cntup_w);
CONE q2q3(1'b0, 1'b0, 1'b0, 1'b0, res[3], res[2], 1'b1, 1'b1, q2q3_w);

assign A0 = { q2q3_w, res[2], 1'b1, res[0] ,1'b1};
assign B0 = { q0q1cntup_w, q0q1cntup_w, q0q1cntup_w, cntup, cntup};

endmodule