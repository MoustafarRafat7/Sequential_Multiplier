`timescale 1ns/1ps
module Shifter_tb
(

);
reg [7:0]inp;
reg [1:0]shift_cntrl;
wire [15:0] shift_out;
Shifter shifter (.inp(inp),.shift_cntrl(shift_cntrl),.shift_out(shift_out));

initial
begin
#300
$finish;
end

initial
begin
inp=100;
shift_cntrl=0;
#10
shift_cntrl=3;
#10
shift_cntrl=1;
#10
shift_cntrl=2;
#10
inp=18;
shift_cntrl=3;
#10
shift_cntrl=1;
#10;
end
endmodule
