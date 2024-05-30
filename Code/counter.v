module counter
(
input clk,
input aclr_n,
output [1:0]count_out
);
reg [1:0]Q_next,Q_reg; 
always@(posedge clk,negedge aclr_n)
begin
Q_reg<=Q_reg;
if(!aclr_n)
Q_reg<=2'b00;
else
Q_reg<=Q_next;
end

always@(Q_reg)
begin
Q_next=Q_reg+(1'b1);
end
assign count_out=Q_reg;
endmodule
