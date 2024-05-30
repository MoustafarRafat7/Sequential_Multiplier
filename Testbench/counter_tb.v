module counter_tb
(
);
reg clk;
reg aclr_n;
wire [1:0]count_out;
localparam T=10;
counter counter1(.clk(clk),.aclr_n(aclr_n),.count_out(count_out));

always
begin
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end


initial
begin
aclr_n=0;
#5
aclr_n=1;
#23
aclr_n=0;
#2
aclr_n=1;
#10;
end
endmodule
