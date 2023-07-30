`timescale 1ns / 1ps

module tb_add_r_type();

reg clk,rst;
processor uut(clk,rst);

initial
     clk = 1'b0;

always 
    #5 clk = ~clk;

initial begin
    #3 rst = 1'b1;
    #30 rst = 1'b0;
    #10 $stop;
end
endmodule
