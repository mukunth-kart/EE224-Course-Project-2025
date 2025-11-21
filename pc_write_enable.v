module program_counter (clk,reset,c3,next_pc, pc_out);
     input    clk;         // System Clock
     input   reset;        // System Reset
     input    c;           // Write Enable (Control Signal c3)
     input  next_pc;      // Input from pc_update_logic (via Mux)
     output  pc_out;        // Output to Code Memory address

    reg [5:0] pc_out;

    always @(posedge clk or negedge reset) begin
        if (reset) begin
            pc_out <= 6'b100000;    // Reset to start address 
        end else if (c3) begin      // Only update if Write Enable (c3) is high
            pc_out <= next_pc;      // Load the calculated next address
        end
    end

endmodule