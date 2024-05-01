// A gated D Latch
module gated_D_latch (Clk, D, Q);
input Clk, D;
output Q;

wire S, R, S_g, R_g, Qa, Qb /* synthesis keep */ ;

assign S = D;
assign R = ~D;
assign R_g = ~(Clk & R);
assign S_g = ~(Clk & S);
assign Qa = ~(S_g & Qb);
assign Qb = ~(R_g & Qa);
assign Q = Qa;

endmodule