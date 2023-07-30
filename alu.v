`timescale 1ns / 1ps

module alu(rst,clk,func,shiftamt,a,b,o_data);
input rst,clk;
input [5:0] func;
input [4:0] shiftamt;
input [31:0] a,b;
output reg [31:0] o_data;

always @(posedge clk) begin
        if(rst) begin
              o_data = 0;
        end
        else begin
              case(func)
                   0 : o_data = a + b;
                   1 : o_data = a - b;
                   2 : o_data = a / b;
                   3 : o_data = a * b;
                   4 : o_data = b >> shiftamt;
                   5 : o_data = b << shiftamt;
              endcase
        end
end
endmodule
