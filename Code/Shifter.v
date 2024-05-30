module Shifter
(
input [7:0]inp,
input [1:0]shift_cntrl ,
output reg [15:0] shift_out
);
always@(inp,shift_cntrl)

begin

case(shift_cntrl)
2'b00: shift_out=inp;
2'b01: shift_out=inp<<4;
2'b10: shift_out=inp<<8;
2'b11: shift_out=inp;
default: shift_out=16'bx;
endcase

end
endmodule
