module COUNTER (
    input clk,
    input reset, 
    input enable,
    output [3:0] counter_in_binary
);
    reg [3:0] current_state;
    reg [3:0] counter_in_binary_reg;
    assign counter_in_binary = counter_in_binary_reg;

    localparam CLK_CYCLES_FOR_1_S = 10_000_000;
    localparam S_0 = 3'b000;
    localparam S_1 = 3'b001;
    localparam S_2 = 3'b010;
    localparam S_3 = 3'b011;
    localparam S_4 = 3'b100;
    localparam S_5 = 3'b101;
    localparam S_6 = 3'b110;
    localparam S_7 = 3'b111;

    wire clk_1_s;
    clk_divider #(CLK_CYCLES_FOR_1_S) clk_divider_instance  (
        .clk(clk),
        .divided_clk(clk_1_s)
    );

    always @(posedge clk_1_s or posedge reset) begin
        if(reset) current_state = S_0;
        else begin
            case (current_state)
                S_0: begin
                    counter_in_binary_reg = 3'b000;

                    if(enable) current_state = S_1;
                    else current_state = S_0;
                end

                S_1: begin
                    counter_in_binary_reg = 3'b001;

                    if(enable) current_state = S_2;
                    else current_state = S_1;
                end

                S_2: begin
                    counter_in_binary_reg = 3'b010;
                    
                    if(enable) current_state = S_3;
                    else current_state = S_2;
                end

                S_3: begin
                    counter_in_binary_reg = 3'b011;

                    if(enable) current_state = S_4;
                    else current_state = S_3;
                end

                S_4: begin
                    counter_in_binary_reg = 3'b100;
                    
                    if(enable) current_state = S_5;
                    else current_state = S_4;
                end

                S_5: begin
                    counter_in_binary_reg = 3'b101;
                    
                    if(enable) current_state = S_6;
                    else current_state = S_5;
                end

                
                S_6: begin
                    counter_in_binary_reg = 3'b110;
                    
                    if(enable) current_state = S_7;
                    else current_state = S_6;
                end

                
                S_7: begin
                    counter_in_binary_reg = 3'b111;
                    
                    if(enable) current_state = S_0;
                    else current_state = S_7;
                end

                default: counter_in_binary_reg = 0;
            endcase
        end
    end 
endmodule