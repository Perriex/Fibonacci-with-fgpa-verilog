`timescale 1ns/1ns

module CONE(a0, a1, sa, b0, b1, sb, s0, s1, f);
    input a0, a1, sa, b0, b1, sb, s0, s1;
    output f;

    wire f1,f2,s2;

    assign s2 = s0 | s1;

    Mux #(1) mux1(.s(sa)
    , .a(a0)
    , .b(a1)
    , .c(f1)
    );

    Mux #(1) mux2(.s(sb)
    , .a(b0)
    , .b(b1)
    , .c(f2)
    );

    Mux #(1) muxF(.s(s2)
    , .a(f1)
    , .b(f2)
    , .c(f)
    );


endmodule