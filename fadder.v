module fadder(a,b,c,S,C);
input a,b,c;
output S,C;
assign S=a^b^c;
assign C=a&b|b&c|c&a;
endmodule
