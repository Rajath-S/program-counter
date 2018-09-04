module fadder_tb;
reg t_a,t_b,t_c;
wire t_S,t_C;
fadder my_fadder(.a(t_a),.b(t_b),.c(t_c),.S(t_S),.C(t_C));
initial begin $dumpfile("fadder_tb.vcd");$dumpvars(0,fadder_tb);end
initial
begin
	$monitor(t_a,t_b,t_c,t_S,t_C);
	t_a=1'b0;
	t_b=1'b0;
	t_c=1'b0;
	#5
	t_a=1'b0;
	t_b=1'b0;
	t_c=1'b1;
	#5
	t_a=1'b0;
	t_b=1'b1;
	t_c=1'b0;
	#5
	t_a=1'b0;
	t_b=1'b1;
	t_c=1'b1;
	#5
	t_a=1'b1;
	t_b=1'b0;
	t_c=1'b0;
	#5
	t_a=1'b1;
	t_b=1'b0;
	t_c=1'b1;
	#5
	t_a=1'b1;
	t_b=1'b1;
	t_c=1'b0;
	#5
	t_a=1'b1;
	t_b=1'b1;
	t_c=1'b1;
	#5
	t_a=1'b0;
	t_b=1'b0;
	t_c=1'b0;
end
endmodule
