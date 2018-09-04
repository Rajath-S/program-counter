module hadder_tb;
reg t_a,t_b;
wire t_s,t_c;
hadder my_hadder(.a(t_a),.b(t_b),.s(t_s),.c(t_c));
initial begin $dumpfile("hadder_tb.vcd");$dumpvars(0,hadder_tb);end
initial
begin
	$monitor(t_a,t_b,t_s,t_c);
	t_a=1'b0;
	t_b=1'b0;
	#5
	t_a=1'b0;
	t_b=1'b1;
	#5
	t_a=1'b1;
	t_b=1'b0;
	#5
	t_a=1'b1;
	t_b=1'b1;
	#5
	t_a=1'b0;
	t_b=1'b0;
end
endmodule
