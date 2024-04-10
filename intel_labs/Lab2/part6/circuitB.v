module circuitB(v, b);
input [3:0] v;

output [3:0] b;

//boolean expression from truth table and K-map 
assign b[3] = v[1];
assign b[2] = ~v[1];
assign b[1] = ~v[1];
assign b[0] = v[0];

endmodule