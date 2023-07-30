`timescale 1ns / 1ps

module regbank(clk,rst,rs,rt,rd,c_sig,i_data,a,b);
input clk,rst;
input [4:0] rs,rt,rd;
input [2:0]c_sig;
input [31:0] i_data;
output reg [31:0] a,b;

integer i;
reg [31:0] register [31:0];

always @(posedge clk) begin
        if(rst) begin
              for(i=0;i<32;i=i+1) begin
                     register[i] = 0;
              end
        end
        else begin
       #2 case (c_sig)
              0 : begin
                   a = register[rs];
                   b = register[rt];
                   register[rd] = i_data;
              end
              1: begin
                   a = register[rs];
                   register[rd] = i_data;
              end
              2: begin
                   a = register[rs];
                   b = register[rt];
              end
        endcase     
        end
end
endmodule
