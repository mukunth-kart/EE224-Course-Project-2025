module DataMemory (
    input  wire Write_Enable,
    input  wire [3:0] Write_Address,
    input  wire [3:0] Read_Address,
    input  wire  [7:0] Data_In,
    output reg  [7:0] Data_Out
);
    reg [7:0] DMEM [0:15];

	 wire [7:0] Data_In_reg;
	 assign Data_In_reg = Data_In;
    always @(Write_Enable, Write_Address, Read_Address, Data_In_reg) begin
        if (Write_Enable) begin
            DMEM[Write_Address] <= Data_In_reg;
        end
        Data_Out <= DMEM[Read_Address];
    end
	 
endmodule