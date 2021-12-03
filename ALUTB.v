`timescale 1ns/1ns

module ALUTB ();

reg modes = 0, ins = 0;
reg [2:0] n = 3'b111, ts = 3'b011;

wire lt;
wire [2:0] dec;
Alu UUT(n, ts, ins, modes, dec, lt);

initial begin
    #20 ts = 3'b0;    
    #20 ins = 1;
    #20 modes = 1'b1;
end
    
endmodule