module dec2to4 (W, Y, En);
input [1:0] W;
input En;
output [0:3] Y;
reg [0:3] Y;
always @(W or En)
begin
if (En == 0)
Y = 4'b0000;
else
case (W)
0: Y = 4'b1000;
1: Y = 4'b0100;
2: Y = 4'b0010;
3: Y = 4'b0001;
endcase
end
endmodule

module dec4to16 (W, Y, En);
input [3:0] W;
input En;
output [0:15] Y;
wire [0:3] M;
dec2to4 Dec1 (W[3:2], M[0:3], En);
dec2to4 Dec2 (W[1:0], Y[0:3], M[0]);
dec2to4 Dec3 (W[1:0], Y[4:7], M[1]);
dec2to4 Dec4 (W[1:0], Y[8:11], M[2]);
dec2to4 Dec5 (W[1:0], Y[12:15], M[3]);
endmodule



module opcode_decoder #(parameter n=8)(In,out)
    
    input [n-1:0] In;
    output[0:26] out;
    wire [0:15] A;
    wire [0:3]  B;
    wire [0:3]  C;
    wire [0:1]  D;
    dec4to16 Dec6 (In[7:4],A,1'b1);
    dec2to4  Dec7 (In[9:8],B,A[1]);
    dec2to4  Dec8 (In[9:8],C,A[15]);

    assign D = (A[12] == 0) ? 2'b00 : 2'b01;

    assign out[0]     = A[0];
    assign out[1:4]   = B;
    assign out[5:14]  = A[2:11];
    assign out[15:16] = D;
    assign out[17:18] = A[13:14];
    assign out[19:22] = C;
    assign out[23] =In[11];
    assign out[24] =In[10];
    assign out[25] =In[9];
    assign out[26] =In[8];


endmodule