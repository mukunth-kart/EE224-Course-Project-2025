module top_module (
    input [15:0] Switches
);
    
    wire [18:1] c;/*c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18;*/
    wire [15:0] instruction;
	 wire [5:0] Data_address;
	 wire [5:0] pc_out;
    wire [5:0] next_pc;
	 wire [7:0] high_instruction,low_instruction;
	 wire [0:26] opcode_decoded;
	 wire ZF,NF,OF, CARRY;
    code_memory CodeMem (
        .clk(Switches[0]), 
        .c1(c[1]), 
        .read_addr(pc_out), 
        .write_addr(Data_address), 
        .write_data(Switches), 
        .instruction(instruction)
    );

    
    assign high_instruction = instruction[15:8];
    assign low_instruction = instruction[7:0];

    
    opcode_decoder #(8) OpcodeDec (
        .In(high_instruction), 
        .out(opcode_decoded)
    );

    
    control_block ControlUnit ( 
        .opcode_decoded(opcode_decoded),
        .ZF(ZF),
        .NF(NF),
        .OF(OF), 
        .control_signals({c[1],c[2],c[3],c[4],c[5],c[6],c[7],c[8],c[9],c[10],c[11],c[12],c[13],c[14],c[15],c[16],c[17],c[18]})
    );

    
    pc_update_logic PCUpdateLogic (
        .current_pc(pc_out),
        .offset(low_instruction[5:0]),
        .c2(c[2]),
        .next_pc(next_pc)
    );

    program_counter ProgramCounter (
        .clk(Switches[0]),
        .reset(Switches[1]),
        .c3(c[3]),
        .next_pc(next_pc),
        .pc_out(pc_out)
    );

    Datapath Datapath (
        .clk(Switches[0]),
		  .switches(Switches),
        .c4(c[4]),.c5(c[5]),.c6(c[6]),.c7(c[7]),.c8(c[8]),.c9(c[9]),.c10(c[10]),.c11(c[11]),.c12(c[12]),.c13(c[13]),.c14(c[14]),.c15(c[15]),.c16(c[16]),.c17(c[17]),.c18(c[18]),
        .in(low_instruction),
        .out(Data_address),
        .flags({OF,NF,ZF,CARRY})
    );  


endmodule