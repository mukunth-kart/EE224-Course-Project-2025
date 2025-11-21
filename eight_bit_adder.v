module eight_bit_adder (
    input wire notadd_sub, // 0 for add, 1 for subtract
    input wire [7:0] A,
    input wire [7:0] B,
    output reg [7:0] OUT,
    output reg CARRY_OUT,
    output reg OVERFLOW
);
    wire [7:0] B_comp;
    wire [8:0] SUM;

    // Two's complement of B for subtraction
    assign B_comp = notadd_sub ? ~B + 8'b00000001 : B;

    // Perform addition
    assign SUM = {1'b0, A} + {1'b0, B_comp};

    always @(*) begin
        OUT = SUM[7:0];
        CARRY_OUT = SUM[8];

        // Overflow detection
        if ((notadd_sub == 0 && A[7] == B_comp[7] && OUT[7] != A[7]) || 
            (notadd_sub == 1 && A[7] != B_comp[7] && OUT[7] != A[7])) begin
            OVERFLOW = 1;
        end else begin
            OVERFLOW = 0;
        end
    end
    
endmodule