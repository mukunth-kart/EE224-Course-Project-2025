module PASR (
    input wire Write_Enable,
    input wire clk,
    input reg [7:0] IN,
    output reg [7:0] OUT
);
reg [7:0] BUFFER;
always @(posedge clk) begin
    if(Write_Enable) begin
        BUFFER <= IN;
    else 
        BUFFER <= BUFFER;
    end
end
OUT <= BUFFER;

endmodule
