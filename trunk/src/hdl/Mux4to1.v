`timescale 1ns/1ns
module Mux4to1(s, in0, in1, in2, in3, c);
	parameter n = 1;
	input [1:0]s;
	input[n-1:0] in0, in1, in2, in3;
	output[n-1:0] c;	

	assign #2 c = s == 2'b00 ? in0
		: s == 2'b01 ? in1
		: s == 2'b10 ? in2 
		: in3
		;
endmodule