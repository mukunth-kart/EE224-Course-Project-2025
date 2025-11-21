module Registers (
    input wire c4,c5,c6,c7,c8,c9,c10,
    input wire clk,
    input wire [7:0] IN,
    output wire [7:0] A_out, B_out
);

    wire [7:0] A, B, C, D;

    // Decode write enable
    wire weA = c10 & ( {c8,c9} == 2'b00 );
    wire weB = c10 & ( {c8,c9} == 2'b01 );
    wire weC = c10 & ( {c8,c9} == 2'b10 );
    wire weD = c10 & ( {c8,c9} == 2'b11 );

    // Static instantiations
    PASR regA (.Write_Enable(weA), .clk(clk), .IN(IN), .OUT(A));
    PASR regB (.Write_Enable(weB), .clk(clk), .IN(IN), .OUT(B));
    PASR regC (.Write_Enable(weC), .clk(clk), .IN(IN), .OUT(C));
    PASR regD (.Write_Enable(weD), .clk(clk), .IN(IN), .OUT(D));

    Register_Select RS (
        .A(A), .B(B), .C(C), .D(D),
        .c4(c4), .c5(c5), .c6(c6), .c7(c7),
        .A_out(A_out), .B_out(B_out)
    );

endmodule
