`timescale 1ns/1ps
module Mux2_1_tb
(
);
reg [3:0]mux_in_a;
reg [3:0]mux_in_b;
reg mux_sel;
wire [3:0] mux_out;

Mux2_1 MUX(.mux_in_a(mux_in_a),.mux_in_b(mux_in_b),.mux_sel(mux_sel),.mux_out(mux_out));

initial
begin
#300
$finish;
end

initial
begin
mux_in_a=10;
mux_in_b=13;
mux_sel=0;
#10
mux_in_a=12;
mux_in_b=13;
#10
mux_in_a=7;
mux_in_b=13;
mux_sel=0;
#10
mux_in_a=7;
mux_in_b=13;
mux_sel=1;
#10
mux_in_a=10;
mux_in_b=12;
#10
mux_in_a=10;
mux_in_b=12;
mux_sel=0;
#10;
end
endmodule
