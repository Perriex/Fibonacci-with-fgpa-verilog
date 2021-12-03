module Alu (n, ts, ins, modes, dec, lt);

    input ins, modes;
    input [2:0] n, ts;

    output lt;
    output [2:0] dec;

    wire f1;
    CONE ins1(ts[1], 1'b1, ts[2], ts[0], 1'b1, ts[1], 1'b0, modes, f1);
    CONE ins2(1'b1, 1'b0, ts[2], ts[2], n[2], ins, ins, f1, dec[2]);
    CONE ins3(1'b1, 1'b0, ts[1], ts[1], n[1], ins, ins, ts[0], dec[1]);
    CONE ins4(1'b1, 1'b0, ts[0], ts[0], n[0], ins, ins, 1'b0, dec[0]);

    assign lt = f1;

endmodule