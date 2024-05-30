module mult_top_tb
(
);
reg [7:0] dataa;
reg [7:0] datab;
reg start;
reg reset_a;
reg clk;
wire done_flag;
wire [15:0] product8x8_out;
wire seg_a;
wire seg_b;
wire seg_c;
wire seg_d;
wire seg_e;
wire seg_f;
wire seg_g;
localparam T=100;

mult_top multiplier(.dataa(dataa),.datab(datab),.start(start),.reset_a(reset_a),.clk(clk),
 		    .done_flag(done_flag),.product8x8_out(product8x8_out),
		    .seg_a(seg_a),.seg_b(seg_b),.seg_c(seg_c),.seg_d(seg_d),
		    .seg_e(seg_e),.seg_f(seg_f),.seg_g(seg_g));

always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial begin
clk=1'b0;
reset_a=1'b0;
start=1'b0;
dataa=8'b11111111;//255
datab=8'b11111110;//254
#(75);
reset_a=1'b1;
start=1'b1;
#(30);
start=1'b0;
#(5*T)
clk=1'b0;
reset_a=1'b0;
start=1'b0;
dataa=8'b00001010;//10
datab=8'b00101000;//40
#(75);
reset_a=1'b1;
start=1'b1;
#(30);
start=1'b0;

end
endmodule
