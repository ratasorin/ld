module D_LATCH (
    input d,
    input en,
    output q
);

wire set, reset, out;

assign set = ~(~d | en);
assign reset = ~(d | en);

SR_LATCH sr_latch_instance(
    .set(set),
    .reset(reset),
    .out(q)
);

endmodule