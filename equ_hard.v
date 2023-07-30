`timescale 1ns / 1ps

module equ_hard(imm,pc,new_addr);
input [15:0] imm;
input [31:0] pc;
output reg [31:0] new_addr;

always @(*) begin
       if(imm[15]==0)
            new_addr = {14'b0,imm,2'b00} + pc;
       else if(imm[15]==1)
            new_addr = ~{14'b1,imm,2'b00} + pc+1;
end
endmodule
