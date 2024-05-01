module part4 (D, Clock, Qa, not_Qa, Qb, not_Qb, Qc, not_Qc);
input D, Clock;

output Qa, not_Qa, Qb, not_Qb, Qc, not_Qc;

D_latch U0 ( .D(D), .Clk(Clock), .Q(Qa), .not_Q(not_Qa) );
posedge_Dflipflop U1 ( .D(D), .Clk(Clock), .Q(Qb), .not_Q(not_Qb) );
negedge_Dflipflop U2 ( .D(D), .Clk(Clock), .Q(Qc), .not_Q(not_Qc) );

endmodule