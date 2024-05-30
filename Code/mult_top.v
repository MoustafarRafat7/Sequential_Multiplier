module mult_top
(
input [7:0] dataa,
input [7:0] datab,
input start,
input reset_a,
input clk,
output done_flag,
output [15:0] product8x8_out,
output seg_a,
output seg_b,
output seg_c,
output seg_d,
output seg_e,
output seg_f,
output seg_g
);
wire sclr_n,clk_ena;
wire [1:0]sel,shift,count;
wire [2:0]state_out;
wire [3:0]aout,bout;
wire [7:0]product;
wire [15:0]shift_out,sum;

Mux2_1 mux4_1(.mux_in_a(dataa[3:0]),.mux_in_b(dataa[7:4]),.mux_sel(sel[1]),.mux_out(aout));

mult4_4 mult4x4 (.data_a(aout),.data_b(bout),.product_(product));

Mux2_1 mux4_2(.mux_in_a(datab[3:0]),.mux_in_b(datab[7:4]),.mux_sel(sel[0]),.mux_out(bout));

Shifter shifter(.inp(product),.shift_cntrl(shift),.shift_out(shift_out));

adder_16 adder(.dataa(shift_out),.datab(product8x8_out),.sum(sum));

reg16 reg_16(.clk(clk),.sclr_n(sclr_n),.clk_ena(clk_ena),.datain(sum),.reg_out(product8x8_out));

counter counter_(.clk(clk),.aclr_n(~start),.count_out(count));

mult_control multiplier_control(.clk(clk),.reset_a(reset_a),.start(start),.count(count),
                                .input_sel(sel),.shift_sel(shift),.state_out(state_out),
         			.done(done_flag),.clk_ena(clk_ena),.sclr_n(sclr_n));

seven_segment_cntrl seven_seg(.inp(state_out),.seg_a(seg_a),.seg_b(seg_b),.seg_c(seg_c),
 			      .seg_d(seg_d),.seg_e(seg_e),.seg_f(seg_f),.seg_g(seg_g));

endmodule
