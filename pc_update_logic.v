module pc_update_logic ( current_pc ,offset , c2 , next_pc);
     input   [5:0] current_pc;   // Current value of the PC (from the PC Register)
     input   [5:0] offset;       // 6-bit offset from the Instruction (bits 5:0)
     input         c2;           // Control Signal C2 (Branch Taken?)
     output  [5:0] next_pc;       // The calculated next address
     wire [5:0] pc_plus_one;
     wire [5:0] branch_address;

    // 1. Calculate PC + 1
    
    assign pc_plus_one = current_pc + 6'b000001;

    // 2. Calculate Branch Address (PC + 1 + Offset)

    assign branch_address = pc_plus_one + offset;

    // 3. Multiplexer to select the next PC
    // Controlled by C2: 0 = Sequential, 1 = Branch/Jump 
    assign next_pc = (c2 == 1'b1) ? branch_address : pc_plus_one;

endmodule