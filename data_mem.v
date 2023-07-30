`timescale 1ns / 1ps

module data_mem(c_sig,arr,i_data,o_data);
input [1:0] c_sig;
input [31:0] arr;
input [31:0] i_data;
output reg [31:0] o_data;

reg [7:0] mem [31:0];

always @(*) begin
       if(c_sig == 2) begin
             o_data = {24'b0,mem[arr]};
       end
       else if(c_sig == 1) begin
             mem[arr] = i_data[7:0];
       end
end
endmodule
