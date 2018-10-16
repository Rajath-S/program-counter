
// Write code for modules you need here
module and_or_16(input wire [15:0] offset, input inc,output wire[15:0] op);
	wire i;
	invert i1(inc,i);
	or2 o(offset[0],inc,op[0]);
	and2 a0(offset[1],i,op[1]);
	and2 a1(offset[2],i,op[2]);
	and2 a2(offset[3],i,op[3]);
	and2 a3(offset[4],i,op[4]);
	and2 a4(offset[5],i,op[5]);
	and2 a5(offset[6],i,op[6]);
	and2 a6(offset[7],i,op[7]);
	and2 a7(offset[8],i,op[8]);
	and2 a8(offset[9],i,op[9]);
	and2 a9(offset[10],i,op[10]);
	and2 a10(offset[11],i,op[11]);
	and2 a11(offset[12],i,op[12]);
	and2 a12(offset[13],i,op[13]);
	and2 a13(offset[14],i,op[14]);
	and2 a14(offset[15],i,op[15]);
endmodule
module reg_16(input wire clk,reset,load,input wire [15:0] in, output wire[15:0] out);
	dfrl d0(.clk(clk),.reset(reset),.load(load),.in(in[0]),.out(out[0]));
	dfrl d1(.clk(clk),.reset(reset),.load(load),.in(in[1]),.out(out[1]));
	dfrl d2(.clk(clk),.reset(reset),.load(load),.in(in[2]),.out(out[2]));
	dfrl d3(.clk(clk),.reset(reset),.load(load),.in(in[3]),.out(out[3]));
	dfrl d4(.clk(clk),.reset(reset),.load(load),.in(in[4]),.out(out[4]));
	dfrl d5(.clk(clk),.reset(reset),.load(load),.in(in[5]),.out(out[5]));
	dfrl d6(.clk(clk),.reset(reset),.load(load),.in(in[6]),.out(out[6]));
	dfrl d7(.clk(clk),.reset(reset),.load(load),.in(in[7]),.out(out[7]));
	dfrl d8(.clk(clk),.reset(reset),.load(load),.in(in[8]),.out(out[8]));
	dfrl d9(.clk(clk),.reset(reset),.load(load),.in(in[9]),.out(out[9]));
	dfrl d10(.clk(clk),.reset(reset),.load(load),.in(in[10]),.out(out[10]));
	dfrl d11(.clk(clk),.reset(reset),.load(load),.in(in[11]),.out(out[11]));
	dfrl d12(.clk(clk),.reset(reset),.load(load),.in(in[12]),.out(out[12]));
	dfrl d13(.clk(clk),.reset(reset),.load(load),.in(in[13]),.out(out[13]));
	dfrl d14(.clk(clk),.reset(reset),.load(load),.in(in[14]),.out(out[14]));
	dfrl d15(.clk(clk),.reset(reset),.load(load),.in(in[15]),.out(out[15]));
endmodule
module adder1(a,b,c,s,c0);
	input  a,b,c;
	output  s,c0;
	wire t1,t2,t3;
	xor3 x1(.i0(a),.i1(b),.i2(c),.o(s));
	and2 x2(.i0(a),.i1(b),.o(t1));
	and2 x3(.i0(b),.i1(c),.o(t2));
	and2 a1(.i0(c),.i1(a),.o(t3));
	or3 o1(.i0(t1),.i1(t2),.i2(t3),.o(c0));
endmodule
module adder4(input wire cin,input wire [3:0] a,b,output  c,output  [3:0] s);
	wire c1,c2,c0;
	adder1 a1(a[0],b[0],cin,s[0],c0);
	adder1 a2(a[1],b[1],c0,s[1],c1);
	adder1 a3(a[2],b[2],c1,s[2],c2);
	adder1 a4(a[3],b[3],c2,s[3],c);
endmodule 
module adder16(input wire cin,input wire [15:0]a,b,output c,output [15:0] s);
	wire c1,c2,c3;
	wire [15:0] xorb;
	xor2 x0(cin,b[0],xorb[0]);
	xor2 x1(cin,b[1],xorb[1]);
	xor2 x2(cin,b[2],xorb[2]);
	xor2 x3(cin,b[3],xorb[3]);
	xor2 x4(cin,b[4],xorb[4]);
	xor2 x5(cin,b[5],xorb[5]);
	xor2 x6(cin,b[6],xorb[6]);
	xor2 x7(cin,b[7],xorb[7]);
	xor2 x8(cin,b[8],xorb[8]);
	xor2 x9(cin,b[9],xorb[9]);
	xor2 x10(cin,b[10],xorb[10]);
	xor2 x11(cin,b[11],xorb[11]);
	xor2 x12(cin,b[12],xorb[12]);
	xor2 x13(cin,b[13],xorb[13]);
	xor2 x14(cin,b[14],xorb[14]);
	xor2 x15(cin,b[15],xorb[15]);

	adder4 a1(cin,a[3:0],xorb[3:0],c1,s[3:0]);
	adder4 a2(c1,a[7:4],xorb[7:4],c2,s[7:4]);
	adder4 a3(c2,a[11:8],xorb[11:8],c3,s[11:8]);
	adder4 a4(c3,a[15:12],xorb[15:12],c,s[15:12]);
endmodule
module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);

// Declare wires here
wire asi,cout;
wire [15:0] and_or_op,add_sub_op;
// Instantiate modules here
or3 o(add,sub,inc,asi);
reg_16 pc1(clk,reset,asi,add_sub_op,pc);
and_or_16 aa(offset,inc,and_or_op);
adder16 bb(sub,pc,and_or_op,cout,add_sub_op);
endmodule
