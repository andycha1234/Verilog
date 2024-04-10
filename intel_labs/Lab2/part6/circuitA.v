module circuitA(v, a);
input [3:0] v;

output [3:0] a;

//boolean expression from truth table and K-map 
assign a[3] = ~v[3];
assign a[2] = (v[2]&v[1]);
assign a[1] = (~v[1]);
assign a[0] = (v[0]);

endmodule