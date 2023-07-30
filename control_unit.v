`timescale 1ns / 1ps

module control_unit(opcode,c_sig);
input [5:0] opcode;
output reg [11:0]c_sig;

// {mux_im_rb,[2:0] rb,mux_rb_alu,[2:0] alu_control,branch,wirte,load,jump}
always @(opcode) begin
       case(opcode)
           0 : c_sig = 12'b0_000_0_000_0_0_0_0; //add(r-type)
           1 : c_sig = 12'b1_001_1_001_0_0_0_0; // addi
           2 : c_sig = 12'b1_001_1_010_0_0_0_0; // muli
           3 : c_sig = 12'b1_001_1_001_0_1_0_0; //lw
           4 : c_sig = 12'b1_010_1_001_0_0_1_0; //st
           5 : c_sig = 12'b0_011_0_100_0_0_0_1; //jump
           6 : c_sig = 12'b1_010_0_011_1_0_0_0; //branch
       endcase
end
endmodule
