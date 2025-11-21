module Registers (
    input wire c4,c5,c6,c7,c8,c9,c10,
    input wire clk,
    input reg [7:0] IN,
    output reg A_out,B_out  
);
    reg [7:0] A,B,C,D;

    always @(*) begin
        case ({c8,c9})
            2'b00: begin
                PASR regA (
                    .Write_Enable(c10),
                    .clk(clk),
                    .IN(IN),
                    .OUT(A)
                );
            end
            2'b01: begin
                PASR regB (
                    .Write_Enable(c10),
                    .clk(clk),
                    .IN(IN),
                    .OUT(B)
                );
            end
            2'b10: begin
                PASR regC (
                    .Write_Enable(c10),
                    .clk(clk),
                    .IN(IN),
                    .OUT(C)
                );
            end
            2'b11: begin
                PASR regD (
                    .Write_Enable(c10),
                    .clk(clk),
                    .IN(IN),
                    .OUT(D)
                );
            end
            default: IN = 8'b00000000;
        endcase
    end

    Register_Select RS (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .c4(c4),
        .c5(c5),
        .c6(c6),
        .c7(c7),
        .A_out(A_out),
        .B_out(B_out)
    );
    
endmodule