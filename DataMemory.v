module DataMemory (
    input  wire Write_Enable,
    input  wire [3:0] Write_Address,
    input  wire [3:0] Read_Address,
    input  reg  [7:0] Data_In,
    output reg  [7:0] Data_Out
);
    reg [15:0] DMEM [7:0];
    always @(Write_Enable, Write_Address, Read_Address, Data_In) begin
        if (Write_Enable) begin
            DMEM[Write_Address] <= Data_In;
        end
        Data_Out <= DMEM[Read_Address];
    end
endmodule