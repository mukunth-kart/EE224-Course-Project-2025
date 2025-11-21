module FLAG_CALC (
    input [7:0] I,
    output reg ZERO,
    output reg NEGATIVE
);
    always @(*) begin
        ZERO = (I == 8'b00000000) ? 1'b1 : 1'b0;
        NEGATIVE = I[7];
    end
    
endmodule