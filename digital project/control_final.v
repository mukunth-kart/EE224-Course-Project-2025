module control_block(
    input wire [26:0] opcode_decoded,
    input wire ZF,
    input wire NF,
    input wire OF,
    output reg [17:0] control_signals
);
    wire [1:0] X;
    wire [1:0] Y;
    assign X = opcode_decoded[11:10];
    assign Y = opcode_decoded[9:8];

    localparam NOOP      = 0;
    localparam INPUTC    = 1;
    localparam INPUTCF   = 2;
    localparam INPUTD    = 3;
    localparam INPUTDF   = 4;
    localparam MOVE      = 5;
    localparam LOADI     = 6;
    localparam ADD       = 7;
    localparam ADDI      = 8;
    localparam SUB       = 9;
    localparam SUBI      = 10;
    localparam LOAD      = 11;
    localparam LOADF     = 12;
    localparam STORE     = 13;
    localparam STOREF    = 14;
    localparam SHIFTL    = 15;
    localparam SHIFTR    = 16;
    localparam CMP       = 17;
    localparam JUMP      = 18;
    localparam BRE       = 19;
    localparam BRNE      = 20;
    localparam BRG       = 21;
    localparam BRGE      = 22;

    localparam C1  = 17;
    localparam C2  = 16;
    localparam C3  = 15;
    localparam C4  = 14;
    localparam C5  = 13;
    localparam C6  = 12;
    localparam C7  = 11;
    localparam C8  = 10;
    localparam C9  = 9;
    localparam C10 = 8;
    localparam C11 = 7;
    localparam C12 = 6;
    localparam C13 = 5;
    localparam C14 = 4;
    localparam C15 = 3;
    localparam C16 = 2;
    localparam C17 = 1;
    localparam C18 = 0;

    always @(*) begin
        control_signals = 18'b0;
        
        case (1'b1)
            opcode_decoded[NOOP]: begin
                control_signals[C3] = 1'b1;
            end
            
            opcode_decoded[INPUTC]: begin
                control_signals[C1] = 1'b1;
                control_signals[C3] = 1'b1;
                control_signals[C15] = 1'b1;
            end
            
            opcode_decoded[INPUTCF]: begin
                control_signals[C1] = 1'b1;
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C11] = 1'b1;
                control_signals[C12] = 1'b1;
            end
            
            opcode_decoded[INPUTD]: begin
                control_signals[C3] = 1'b1;
                control_signals[C15] = 1'b1;
                control_signals[C16] = 1'b1;
                control_signals[C17] = 1'b1;
            end
            
            opcode_decoded[INPUTDF]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C11] = 1'b1;
                control_signals[C16] = 1'b1;
                control_signals[C17] = 1'b1;
            end
            
            opcode_decoded[MOVE]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = Y[1];
                control_signals[C5] = Y[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C11] = 1'b1;
                control_signals[C12] = 1'b1;
            end
            
            opcode_decoded[LOADI]: begin
                control_signals[C3] = 1'b1;
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C15] = 1'b1;
            end
            
            opcode_decoded[ADD]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C6] = Y[1];
                control_signals[C7] = Y[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C12] = 1'b1;
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[ADDI]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C11] = 1'b1;
                control_signals[C12] = 1'b1;
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[SUB]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C6] = Y[1];
                control_signals[C7] = Y[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[SUBI]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C11] = 1'b1;
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[LOAD]: begin
                control_signals[C3] = 1'b1;
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C15] = 1'b1;
                control_signals[C18] = 1'b1;
            end
            
            opcode_decoded[LOADF]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = Y[1];
                control_signals[C5] = Y[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C11] = 1'b1;
                control_signals[C12] = 1'b1;
                control_signals[C18] = 1'b1;
            end
            
            opcode_decoded[STORE]: begin
                control_signals[C3] = 1'b1;
                control_signals[C6] = X[1];
                control_signals[C7] = X[0];
                control_signals[C15] = 1'b1;
                control_signals[C17] = 1'b1;
            end
            
            opcode_decoded[STOREF]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = Y[1];
                control_signals[C5] = Y[0];
                control_signals[C6] = X[1];
                control_signals[C7] = X[0];
                control_signals[C11] = 1'b1;
                control_signals[C12] = 1'b1;
                control_signals[C17] = 1'b1;
            end
            
            opcode_decoded[SHIFTL]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[SHIFTR]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C8] = X[1];
                control_signals[C9] = X[0];
                control_signals[C10] = 1'b1;
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[CMP]: begin
                control_signals[C3] = 1'b1;
                control_signals[C4] = X[1];
                control_signals[C5] = X[0];
                control_signals[C6] = Y[1];
                control_signals[C7] = Y[0];
                control_signals[C13] = 1'b1;
                control_signals[C14] = 1'b1;
            end
            
            opcode_decoded[JUMP]: begin
                control_signals[C2] = 1'b1;
                control_signals[C3] = 1'b1;
            end
            
            opcode_decoded[BRE]: begin
                control_signals[C2] = ZF;
                control_signals[C3] = 1'b1;
            end
            
            opcode_decoded[BRNE]: begin
                control_signals[C2] = ~ZF;
                control_signals[C3] = 1'b1;
            end
            
            opcode_decoded[BRG]: begin
                control_signals[C2] = ~ZF && (NF ~^ OF);
                control_signals[C3] = 1'b1;
            end
            
            opcode_decoded[BRGE]: begin
                control_signals[C2] = NF ~^ OF;
                control_signals[C3] = 1'b1;
            end
            
            default: begin
                control_signals = 18'b0;
            end
        endcase
    end

endmodule