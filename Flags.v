module Flags (
    input Write_Enable,
    input clk,
    input carry,
    input zero,
    input negative,
    input overflow,
    output reg Carry_Flag,
    output reg Zero_Flag,
    output reg Negative_Flag,
    output reg Overflow_Flag
);
    always @(posedge clk) begin
        if(Write_Enable) begin
            Carry_Flag <= carry;
            Zero_Flag <= zero;
            Negative_Flag <= negative;
            Overflow_Flag <= overflow;
        end else begin
            Carry_Flag <= Carry_Flag;
            Zero_Flag <= Zero_Flag;
            Negative_Flag <= Negative_Flag;
            Overflow_Flag <= Overflow_Flag;
        end
    end
    
endmodule