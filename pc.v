`timescale 1ns / 1ps

module p_c(clk,rst,ppc,npc);
input clk,rst;
input [31:0] ppc;
output reg [31:0] npc;

always @(posedge clk) begin
        if(rst) begin
            npc = 0;
        end
        else begin
            #2 npc = ppc;
        end
end
endmodule
