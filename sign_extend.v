`timescale 1ns / 1ps

module sign_extend(in_1,out);
input [15:0] in_1;
output reg [31:0] out;

wire s_bit = in_1[15];
always @(*) begin
       if(s_bit == 1)
           out = {16'b1,in_1};
       else
           out = {16'b0,in_1};
end
endmodule
