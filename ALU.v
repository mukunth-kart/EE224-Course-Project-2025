module ALU (
    input wire [1:0] ALU_SELECT,
    input wire [7:0] A,
    input wire [7:0] B,
    output wire [7:0] ALU_RESULT,
    output wire CARRY,
    output wire OVERFLOW,
    output wire ZERO,
    output wire NEGATIVE
);

    // Internal signals
    wire [7:0] ADD_RESULT;
    wire ADD_CARRY;
    wire ADD_OVERFLOW;

    wire [7:0] SHIFT_RESULT;
    wire SHIFT_OUT;

    // ---- Arithmetic block ----
    eight_bit_adder adder_inst (
        .notadd_sub(ALU_SELECT[0]),
        .A(A),
        .B(B),
        .OUT(ADD_RESULT),
        .CARRY_OUT(ADD_CARRY),
        .OVERFLOW(ADD_OVERFLOW)
    );

    // ---- Shifter block ----
    eight_bit_shifter shifter_inst (
        .notL_R(ALU_SELECT[0]),
        .IN(A),
        .OUT(SHIFT_RESULT),
        .SHIFT_OUT(SHIFT_OUT)
    );

    // ---- MUX: select arithmetic OR shift ----
    assign ALU_RESULT = (ALU_SELECT[1] == 1'b1) ? ADD_RESULT : SHIFT_RESULT;

    assign CARRY     = (ALU_SELECT[1] == 1'b1) ? ADD_CARRY : SHIFT_OUT;
    assign OVERFLOW  = (ALU_SELECT[1] == 1'b1) ? ADD_OVERFLOW : 1'b0;

    // ---- Flags based on *final* ALU output ----
    FLAG_CALC flag_calc_inst (
        .I(ALU_RESULT),
        .ZERO(ZERO),
        .NEGATIVE(NEGATIVE)
    );

endmodule
