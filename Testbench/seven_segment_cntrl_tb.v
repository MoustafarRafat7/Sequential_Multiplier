module seven_segment_cntrl_tb
(
);
wire seg_a;
wire seg_b;
wire seg_c;
wire seg_d;
wire seg_e;
wire seg_f;
wire seg_g;
reg [2:0]inp;

seven_segment_cntrl seven_seg(.inp(inp),.seg_a(seg_a),.seg_b(seg_b),.seg_c(seg_c),
.seg_d(seg_d),.seg_e(seg_e),.seg_f(seg_f),.seg_g(seg_g));

wire[6:0]seg;
assign seg={seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g};
initial
begin
#300
$finish;
end

initial
begin
inp=3'b000;
#20
inp=3'b001;
#20
inp=3'b010;
#20
inp=3'b011;
#20
inp=3'b101;
#20
inp=3'b110;
#20;
end
endmodule
