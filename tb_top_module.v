`timescale 1ns/1ps

module tb_top_module;

    reg  [15:0] Switches;
    reg clk;
    reg reset;

    wire dummy;   // Unused wire because top_module only takes Switches

    // === Instantiate CPU ===
    top_module UUT (
        .Switches(Switches)
    );

    // === Clock generation ===
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Map clock and reset onto Switches
    always @(*) begin
        Switches[0] = clk;
        Switches[1] = reset;
    end

    // =================================================================
    // Expected memory content AFTER bubble sort (8 elements sorted)
    // Quartus does NOT allow reg [] declared inside initial block
    // =================================================================
    reg [15:0] expected_mem [0:7];

    initial begin
        expected_mem[0] = 16'd3;
        expected_mem[1] = 16'd7;
        expected_mem[2] = 16'd10;
        expected_mem[3] = 16'd11;
        expected_mem[4] = 16'd20;
        expected_mem[5] = 16'd25;
        expected_mem[6] = 16'd40;
        expected_mem[7] = 16'd99;
    end


    // =================================================================
    // Test sequence
    // =================================================================
    integer i;
	 integer errors;


    initial begin
        $display("\n--- CPU BUBBLE SORT TEST STARTED ---");

        reset = 1;
        #20;
        reset = 0;

        // ------------------------------------------------
        // Load program using write interface (C1 = write enable)
        // Quartus requires Switches to be assigned explicitly
        // ------------------------------------------------
        $display("Loading program into code_memory...");

        for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk);
            Switches[0] = clk;  // clock
            Switches[1] = 0;    // reset low

            // Data placed in upper 10 bits (your CPU uses write_data = Switches)
            Switches[15:6] = program_mem[i];  
            Switches[5:0]  = i;              // write address
            force UUT.c[1] = 1;             // Write enable
        end

        @(posedge clk);
        force UUT.c[1] = 0;  // Disable write

        $display("Program loaded. Running CPU...");

        // ------------------------------------------------
        // Run CPU long enough for bubble sort to finish
        // ------------------------------------------------
        repeat (500) @(posedge clk);

        // ------------------------------------------------
        // Compare memory contents
        // ------------------------------------------------
        $display("\nChecking sorted output...");

        errors = 0;

        for (i = 0; i < 8; i = i + 1) begin
            if (UUT.CodeMem.memory[i] !== expected_mem[i]) begin
                $display("❌ MISMATCH at memory[%0d]: expected %0d, got %0d",
                    i, expected_mem[i], UUT.CodeMem.memory[i]);
                errors = errors + 1;
            end
        end

        if (errors == 0)
            $display("\n✅ TEST PASSED — Bubble Sort Correct!\n");
        else
            $display("\n❌ TEST FAILED — %0d mismatches found.\n", errors);

        $stop;
    end


    // =================================================================
    // Program Memory (Bubble Sort Program)
    // =================================================================
    reg [15:0] program_mem [0:31];

    initial begin
        // TODO: Replace with your actual ISA instructions
        program_mem[0] = 16'h1001;
        program_mem[1] = 16'h1002;
        program_mem[2] = 16'h2003;
        program_mem[3] = 16'hF000;  // HALT
        // fill rest
        for (i = 4; i < 32; i = i + 1)
            program_mem[i] = 16'h0000;
    end

endmodule
