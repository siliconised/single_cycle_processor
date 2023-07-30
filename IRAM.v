`timescale 1ns / 1ps

module IRAM(clk,pc,instr);
input clk;
input [31:0] pc;
output reg [31:0] instr;

always @(posedge clk) begin
            case (pc/4)
               //0 : inst=32'b000000_00001_00010_00011_00000_000000;
               0 : instr=32'b000001_00100_00101_0000000000000001;  //add1
               1 : instr=32'b000001_00100_00110_0000000000000100;  //add1
               2 : instr=32'b000000_00101_00110_00011_00000_000000; // add(r_type)
               3 : instr=32'b000010_00011_00011_0000000000000010; //  muli
               4 : instr=32'b000100_00011_00011_0000000000000000; //load
               5 : instr=32'b000011_00011_00000_0000000000000000; //store
               6 : instr=32'b000101_00000000000000000000000000;  //jump
               7 : instr=32'b000110_00001_00011_0000000000000101;  //branch
           endcase
end
endmodule
