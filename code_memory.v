module code_memory ( clk, c1,  read_addr,  write_addr,  write_data,  instruction );

     input        clk;           // System Clock
     input         c1;            // Write Enable (Control Signal c1)
     input   [5:0]  read_addr;     // Read Address (from Program Counter)
     input   [5:0]  write_addr;    // Write Address (from Instruction Operand)
     input   [15:0] write_data;    // Data to write (from Switches)
     output  [15:0] instruction;    // The instruction at read_addr

    // Declare the memory array: 64 words of 16 bits each 
    reg [15:0] memory [0:63];

    // Asynchronous Read: 
    // The instruction is output immediately when the PC address changes.
    // This is necessary for the Control Unit to decode the opcode 
    // and set up signals within the same clock cycle.
    assign instruction = memory[read_addr];

    // Synchronous Write:
    // Writing to memory 
    always @(posedge clk) begin
        if (c1) begin
            memory[write_addr] <= write_data; 
        end
    end

//    // Bubble Sort Program for Simulation
//
//    initial begin
//        // Clear memory
//        integer i;
//        for (i = 0; i < 64; i = i + 1) memory[i] = 16'b0;
//
//     // 2. Load the Bubble Sort Machine Code
//        // ---------------------------------------------------------
//        // Initialization
//        // ---------------------------------------------------------
//        // 0: LOADI A, 0  (Initialize i = 0)
//        memory[0]  = 16'b0011000000000000; 
//
//        // ---------------------------------------------------------
//        // Outer Loop Label: "Outer"
//        // ---------------------------------------------------------
//        // 1: LOAD D, [last] (Load loop limit 7 from addr 8 into D)
//        memory[1]  = 16'b1000110000001000; 
//        
//        // 2: LOADI B, 0  (Initialize j = 0)
//        memory[2]  = 16'b0011010000000000; 
//
//        // 3: CMP A, D    (Compare i with last)
//        memory[3]  = 16'b1101001100000000; 
//
//        // 4: BRGE End    (If i >= last, jump to End. Offset +14)
//        // Target: 4 + 1 + 14 = 19
//        memory[4]  = 16'b1111001100001110; 
//
//        // ---------------------------------------------------------
//        // Inner Loop Label: "Inner"
//        // ---------------------------------------------------------
//        // 5: LOAD D, [last] (Reload limit 7 into D)
//        memory[5]  = 16'b1000110000001000; 
//
//        // 6: SUB D, A    (D = last - i. Optimization for Bubble Sort)
//        memory[6]  = 16'b0110110000000000; 
//
//        // 7: CMP B, D    (Compare j with last-i)
//        memory[7]  = 16'b1101011100000000; 
//
//        // 8: BRGE Iinc   (If j >= last-i, inner loop done. Jump to Iinc. Offset +8)
//        // Target: 8 + 1 + 8 = 17
//        memory[8]  = 16'b1111001100001000; 
//
//        // ---------------------------------------------------------
//        // Label: "If" (Compare array elements)
//        // ---------------------------------------------------------
//        // 9: LOADF C, [array+B]   (Load array[j] into C. Array starts at 0)
//        memory[9]  = 16'b1001100100000000; 
//
//        // 10: LOADF D, [array+B+1] (Load array[j+1] into D)
//        memory[10] = 16'b1001110100000001; 
//
//        // 11: CMP D, C    (Compare array[j+1] with array[j])
//        memory[11] = 16'b1101111000000000; 
//
//        // 12: BRGE Jinc   (If array[j+1] >= array[j], no swap needed. Jump to Jinc. Offset +2)
//        // Target: 12 + 1 + 2 = 15
//        memory[12] = 16'b1111001100000010; 
//
//        // ---------------------------------------------------------
//        // Label: "Swap"
//        // ---------------------------------------------------------
//        // 13: STOREF [array+B], D   (Store smaller value at j)
//        memory[13] = 16'b1011110100000000; 
//
//        // 14: STOREF [array+B+1], C (Store larger value at j+1)
//        memory[14] = 16'b1011100100000001; 
//
//        // ---------------------------------------------------------
//        // Label: "Jinc" (Increment j)
//        // ---------------------------------------------------------
//        // 15: ADDI B, 1   (j++)
//        memory[15] = 16'b0101010000000001; 
//
//        // 16: JUMP Inner  (Jump back to start of Inner loop. Offset -12)
//        // Target: 16 + 1 - 12 = 5.  -12 in 6-bit 2's complement is 110100
//        memory[16] = 16'b1110000011110100; 
//
//        // ---------------------------------------------------------
//        // Label: "Iinc" (Increment i)
//        // ---------------------------------------------------------
//        // 17: ADDI A, 1   (i++)
//        memory[17] = 16'b0101000000000001; 
//
//        // 18: JUMP Outer  (Jump back to start of Outer loop. Offset -18)
//        // Target: 18 + 1 - 18 = 1. -18 in 6-bit 2's complement is 101110
//        memory[18] = 16'b1110000011101110; 
//
//        // ---------------------------------------------------------
//        // Label: "End"
//        // ---------------------------------------------------------
//        // 19: NOOP        (Program Done)
//        memory[19] = 16'b0000000000000000; 
//    end

endmodule