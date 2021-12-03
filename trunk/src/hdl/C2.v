`timescale 1ps/1ps

module CTWO(d0, d1, d2, d3, a0, a1, b0, b1, out);
    input d0, d1, d2, d3, a0, a1, b0, b1;
    output out;

    wire s0,s1; 

    assign #500 s1 = a1 | b1;
    
    assign #500 s0 = a0 & b0;

    Mux4to1 #(1) smux(.s({s1,s0})
    , .in0(d0)  
    , .in1(d1)  
    , .in2(d2) 
    , .in3(d3)  
    , .c(out)
    );

endmodule