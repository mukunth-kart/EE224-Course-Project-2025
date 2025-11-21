module ALU (
    wire [1:0] ALU_SELECT,
    wire [7:0] A,
    wire [7:0] B,
    output reg [7:0] ALU_RESULT,
    output reg CARRY,
    output reg OVERFLOW
    output reg ZERO,
    output reg NEGATIVE
);
    wire [7:0] SHIFT_RESULT;
    wire CARRY_INT;
    wire OVERFLOW_INT;
    wire [7:0] ALU_RESULT_INT;
    wire SHIFT_OUT_INT
    eight_bit_adder adder_inst (
        .notadd_sub(ALU_SELECT[0]),
        .A(A),
        .B(B),
        .OUT(ALU_RESULT_INT),
        .CARRY_OUT(CARRY_INT),
        .OVERFLOW(OVERFLOW_INT)
    );

    eight_bit_shifter shifter_inst (
        .notL_R(ALU_SELECT[0]),
        .IN(A),
        .OUT(SHIFT_RESULT),
        .SHIFT_OUT(SHIFT_OUT_INT)
    );

    FLAG_CALC flag_calc_inst (
        .I(ALU_RESULT),
        .ZERO(ZERO),
        .NEGATIVE(NEGATIVE)
    );

    assign ALU_RESULT = (ALU_SELECT[1] == 1) ? ALU_RESULT_INT : SHIFT_RESULT;
    assign CARRY = (ALU_SELECT[1] == 1) ? CARRY_INT : SHIFT_OUT_INT;
    assign OVERFLOW = (ALU_SELECT[1] == 1) ? OVERFLOW_INT : 1'b0; 
endmodule