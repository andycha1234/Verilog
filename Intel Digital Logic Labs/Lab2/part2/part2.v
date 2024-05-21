module part2(V, LEDR, d0, d1);
input [3:0] V;

output [9:0] LEDR;
output [0:6] d0, d1;

wire [3:0] A, G;
wire [6:0] HEX0, HEX1;
wire Z;

assign LEDR[9:4] = 0; 
assign LEDR[3:0] = V;
assign d0 = HEX0;
assign d1 = HEX1;

comparator U1(.v(V), .z(Z));
circuitA U2(.v(V), .a(A));
mux2to1 U0(.x(V), .y(A), .s(Z), .m(G));
char_7seg U3(.C(G), .segment(HEX0));
char_7seg U4(.C(Z), .segment(HEX1));

endmodule