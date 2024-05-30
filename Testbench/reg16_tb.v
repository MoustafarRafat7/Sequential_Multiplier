module reg16_tb
(
);
reg [15:0]datain;
reg clk;
reg clk_ena;
reg sclr_n;
wire [15:0]reg_out;
localparam T=20;

reg16 register(.datain(datain),.clk(clk),.clk_ena(clk_ena),.sclr_n(sclr_n),.reg_out(reg_out));

always
begin
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end
//Test Cases
initial
begin
sclr_n=0;
clk_ena=1'b0;
datain=1000;
#11
sclr_n=1;
#15
clk_ena=1'b1;
#15
sclr_n=0;
#15
clk_ena=1'b1;
sclr_n=1;
datain=20;
#15
datain=16'b1;
sclr_n=0;
#15;
end
endmodule
