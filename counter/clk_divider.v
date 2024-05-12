

module clk_divider #(parameter DIVIDE_BY = 1) (
    input clk,
    output divided_clk
);

// a register on 23 bits can hold values from 0 -> 2^24 - 1 = 16_777_215
reg [23:0] current_clk_cycle = 0;
reg divided_clk_internal = 0;
assign divided_clk = divided_clk_internal;

always @(posedge clk) begin
    if(current_clk_cycle < DIVIDE_BY) begin 
        divided_clk_internal = divided_clk_internal;
        current_clk_cycle = current_clk_cycle + 1;
    end 
    else begin
        divided_clk_internal = ~divided_clk_internal;
        current_clk_cycle = 0;
    end
end

endmodule