`timescale 1ns / 1ps

module ctrl_alu(c_sig,i_func,i_shift_amt,func,shift_amt);
input [2:0]c_sig;
input [5:0] i_func;
input [4:0] i_shift_amt;
output reg [5:0] func;
output reg [4:0] shift_amt;

always @(c_sig) begin
     case(c_sig) 
          0 : begin
              func = i_func;
              shift_amt = i_shift_amt;
          end
          1 : begin
              func = 6'b0;
              shift_amt = i_shift_amt;
          end
          2 : begin
              func = 6'b000011;
              shift_amt = i_shift_amt;
          end
          3 : begin
              func = 6'b000001;
              shift_amt = i_shift_amt;
          end
     endcase
end
endmodule
