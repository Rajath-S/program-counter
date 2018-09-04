module andgate_tb;
reg t_a,t_b;
wire t_y;
and_gate my_gate(.a(t_a),.b(t_b),.y(t_y));
initial begin $dumpfile("andgate_tb.vcd");$dumpvars(0,andgate_tb);end
initial
begin
	$monitor(t_a,t_b,t_y);
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
end
endmodule
	


