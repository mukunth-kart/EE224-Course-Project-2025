module eight_bit_shifter (
    input wire notL_R,
    input wire [7:0] IN,
    output reg [7:0] OUT,
    output reg SHIFT_OUT
);
	 always@(*) begin
		 if(notL_R) begin
			  // Logical Right Shift
			  OUT = {1'b0, IN[7:1]};
			  SHIFT_OUT = IN[0];
		 end else begin
			  // Logical Left Shift
			  OUT = {IN[6:0], 1'b0};
			  SHIFT_OUT = IN[7];
		 end
	 end
endmodule