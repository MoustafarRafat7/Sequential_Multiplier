`timescale 1ns/1ps
module adder_16_tb
(
);
reg [15:0]dataa;
reg [15:0]datab;
wire[15:0]sum;

adder_16 adder(.dataa(dataa),.datab(datab),.sum(sum));

initial
begin
#300
$finish;
end

initial
begin
dataa=26;
datab=2;
#10
dataa=200;
datab=100;
#10
dataa=89;
datab=11;
#10
dataa=1000;
datab=200;
#10
dataa=9000;
datab=11000;
#10
dataa=20000;
datab=2000;
#10;
end
endmodule
