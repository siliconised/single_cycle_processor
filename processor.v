`timescale 1ns / 1ps

module processor(clk,rst);
input clk,rst;

wire [31:0] ppc,ppc_1,ppc_2,ppc_new,npc,s_e_imm;
wire [31:0] instr;
wire [31:0] aluout,a,rb_b,b,o_data,wirte_back;
wire [11:0] c_sig;

wire late_clk;
wire [5:0] opcode;
wire [4:0] rs,rt,rd_1,rd,s_a,shift_amt;
wire [5:0] func,funct;
wire [15:0] imm;
wire [25:0] j_addr;

assign opcode = instr[31:26];
assign imm    = instr[15:0];
assign rd_1   = instr[15:11];
assign rt     = instr[20:16];
assign rs     = instr[25:21];
assign s_a    = instr[10:6];
assign func   = instr[5:0];
assign j_addr   =  instr[25:0];

clk_div n_clk(clk,rst,late_clk);
p_c      pc    (late_clk,rst,ppc_new,npc);
inc_pc   ipc   (npc,ppc);
equ_hard eh(imm,ppc,ppc_1);

assign ppc_2 = (c_sig[3]&~|(aluout))?ppc_1:ppc;

assign ppc_new = c_sig[0]?{ppc[31:26],j_addr,2'b00}:ppc_2;

IRAM     iram  (late_clk,npc,instr);
control_unit cu(opcode,c_sig);
sign_extend ime_alu (imm,s_e_imm);

assign rd = c_sig[11]?rt:rd_1;

regbank  rb    (clk,rst,rs,rt,rd,c_sig[10:8],wirte_back,a,rb_b);

assign b  = c_sig[7]?s_e_imm:rb_b;

ctrl_alu c_a (c_sig[6:4],func,s_a,funct,shift_amt);
alu      a_l_u (rst,clk,funct,shift_amt,a,b,aluout);
data_mem dm(c_sig[2:1],aluout,rb_b,o_data);

assign wirte_back = c_sig[2]?o_data:aluout;
endmodule
