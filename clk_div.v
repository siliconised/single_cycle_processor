`timescale 1ns / 1ps

module clk_div(clk,rst,late_clk);
input clk,rst;
output reg late_clk;

reg [1:0] counter;

always @(posedge clk) begin
           if(counter == 0) begin
                  counter  <= 1;
                  late_clk <= 1;
           end
           else begin
                 counter  <= 0;
                 late_clk <= 0;
           end
end
endmodule
