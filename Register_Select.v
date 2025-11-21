module Register_Select (
    input [7:0] A,B,C,D,
    input wire c4,c5,c6,c7,
    output reg [7:0] A_out,B_out
);
    always @(*) begin
        case ({c4,c5})
            2'b00: A_out = A;
            2'b01: A_out = B;
            2'b10: A_out = C;
            2'b11: A_out = D;
            default: A_out = 8'b00000000;
        endcase
        case ({c6,c7})
            2'b00: B_out = A;
            2'b01: B_out = B;
            2'b10: B_out = C;
            2'b11: B_out = D;
            default: B_out = 8'b00000000;
        endcase
    end
endmodule