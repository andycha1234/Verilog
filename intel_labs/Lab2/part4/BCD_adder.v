module BCD_adder (SW, LEDR, HEX0, HEX1, HEX3, HEX5);
input [9:0] SW;

output [9:0] LEDR;
output [0:6] HEX0, HEX1, HEX3, HEX5;

wire [3:0] X, Y, A, B, K, G, m_outx, m_outy;
wire Z, Q, T, D;
wire [9:0] S;
wire [0:6] seg0, seg1, seg3, seg5;

assign X = SW[7:4];
assign Y = SW[3:0];

assign LEDR[3:0] = S[3:0];
assign LEDR[4] = S[4];

assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX3 = seg3;
assign HEX5 = seg5;

//if either X or Y is more than 9, indicate error by switching LEDR[9] on 
assign LEDR[9] = Z|Q;

//check if first input is greater than 9
comparator U0( .v(X), .z(Z) );
//if greater than 9, LEDR[9] = 0, if not HEX5 display number for input X
mux2to1 U1( .x(X), .y(4'b1111), .s(Z), .m(m_outx) );
//print number to HEX5
char_7seg U2( .C(m_outx), .segment(seg5) );

//check if second input is greater than 9
comparator G0( .v(Y), .z(Q) );
//if greater than 9, LEDR[9] = 0, if not HEX3 display number for input Y
mux2to1 G1( .x(Y), .y(4'b1111), .s(Q), .m(m_outy) );
//print number to HEX3
char_7seg G2( .C(m_outy), .segment(seg3) );

ripple_carry_adder H0( .SW(SW), .LEDR(S) );
comparator H1( .v(S[3:0]), .z(T) );
or H2(D, T, S[4]);
char_7seg H3( .C(D), .segment(seg1) );

circuitA H4( .v(S[3:0]), .a(A) );
mux2to1 H5( .x(S[3:0]), .y(A), .s(T), .m(G) );
circuitB H6( .v(S[3:0]), .b(B) );
mux2to1 H7( .x(G), .y(B), .s(S[4]), .m(K) );
char_7seg H8( .C(K), .segment(seg0) );

endmodule