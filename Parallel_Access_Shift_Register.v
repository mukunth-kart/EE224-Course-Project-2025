module PASR (
    input wire Write_Enable,
    input wire clk,
    input wire [7:0] IN,
    output wire [7:0] OUT
);
reg [7:0] BUFFER;
always @(posedge clk) begin
    if(Write_Enable) begin
        BUFFER <= IN;
    end else begin
        BUFFER <= BUFFER;
    end
end
assign OUT = BUFFER;

endmodule
