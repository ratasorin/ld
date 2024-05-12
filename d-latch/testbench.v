`timescale 1ns/1ps
module testbench;
    reg d, en;
    wire q;
    D_LATCH d_latch_instance(
        .d(d),
        .en(en),
        .q(q)
    );

initial begin
    d = 0;
    en = 0;

    #10

    en = 1;
    d = 1;

    #10

    d = 0;

    #10 

    d = 1;

    #10

    en = 0;

    #10

    d = 0;

    #10
    d = 1;
end

endmodule