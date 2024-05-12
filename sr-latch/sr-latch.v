module SR_LATCH (
    input set,
    input reset,
    output out
);

    wire not_out;
    assign out = ~(not_out | reset);
    assign not_out = ~(out | set);

endmodule