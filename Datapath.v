module Datapath (
    input wire c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,
    input wire clk,
    input wire [7:0] in,
    output wire [3:0] flags,
    output wire [5:0] out
);
    wire [7:0] A_wire, B_wire;
    wire [3:0] flags_internal;


    Registers regs_inst (
        .c4(c4),
        .c5(c5),
        .c6(c6),
        .c7(c7),
        .c8(c8),
        .c9(c9),
        .c10(c10),
        .clk(clk),
        .IN(out_internal),
        .A_out(A_wire),
        .B_out(B_wire)
    );
    wire [7:0] B_wire_mux;
    assign B_wire_mux = (c11) ? in : B_wire;
    wire [7:0] ALU_result;
    ALU alu_inst (
        .ALU_SELECT({c12,c13}),
        .A(A_wire),
        .B(B_wire_mux),
        .ALU_RESULT(ALU_result),
        .CARRY(flags_internal[0]),
        .OVERFLOW(flags_internal[1]),
        .ZERO(flags_internal[2]),
        .NEGATIVE(flags_internal[3])
    );
    Flags_Register flags_reg_inst (
        .clk(clk),
        .Write_Enable(c14),
        .flags_in(flags_internal),
        .flags_out(flags)
    );

    Data_Address = (c15) ? in : ALU_result;
    Data_Address_In = Data_Address[3:0];

    Data_In = (c16) ? switches[7:0] : B_wire;
    DataMemory data_mem_inst (
        .Write_Enable(c17),
        .Write_Address(Data_Address_In),
        .Read_Address(Data_Address_In),
        .Data_In(Data_In),
        .Data_Out(Data_Out)
    );

    assign out_internal = (c18) ? Data_Out : Data_Address;
    assign out = Data_Address[5:0];
    
    
endmodule