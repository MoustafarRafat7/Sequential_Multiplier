module mult4_4_tb
(

);
reg [3:0]data_a;
reg [3:0]data_b;
wire[7:0]product;

mult4_4 multiplier(.data_a(data_a),.data_b(data_b),.product(product));
initial
begin
#300
$finish;
end

initial
begin
data_a=13;
data_b=2;
#10
data_a=2;
data_b=10;
#10
data_a=4;
data_b=11;
#10
data_a=1;
data_b=13;
#10
data_a=12;
data_b=3;
#10
data_a=10;
data_b=3;
#10;
end
endmodule
