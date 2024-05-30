`timescale 1ns/1ps
module mult_control_tb
(

);
reg clk;
reg reset_a;
reg start;
reg [1:0]count;
wire [1:0]input_sel;
wire [1:0]shift_sel;
wire [2:0]state_out;
wire done;
wire clk_ena;
wire sclr_n;
localparam T=20;

mult_control cntrl(.clk(clk),.reset_a(reset_a),.start(start),.count(count),.input_sel(input_sel)
,.shift_sel(shift_sel),.state_out(state_out),.done(done),.clk_ena(clk_ena),.sclr_n(sclr_n));
always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

// Test cases
initial 
begin
reset_a=1'b0;
start=1'b0;
count=2'b00;
#(T);
//IDLE
reset_a=1'b1;
start=1'b1;
#(T);
//LSB
start=1'b0;
count=2'b00;
#(T);
//MID
start=1'b0;
count=2'b10;
#(T);
//MSB
start=1'b0;
count=2'b11;
#(T);
//calc_done
start=1'b0;
count=2'b11;
#(T);
//IDLE
start=1'b1;
count=2'b00;
#(T);
//LSB
start=1'b1;
count=2'b00;
#(T);
//ERR
end
endmodule
