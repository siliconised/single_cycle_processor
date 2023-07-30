`timescale 1ns / 1ps

module mux_2(in_1,in_2,c_sig,out);
input [4:0] in_1;
input [4:0] in_2;
input c_sig;
output reg [4:0] out;

always @(c_sig) begin
      out = c_sig ? in_2 : in_1;
end

endmodule
