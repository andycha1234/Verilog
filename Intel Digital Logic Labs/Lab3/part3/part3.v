module part3 (SW, Q, Q_not, LEDR);
input [1:0] SW;

output [9:0] LEDR;
output Q, Q_not;

wire D, Clock, Qm, Qs;

assign D = SW[0];
assign Clock = SW[1];

assign Q = Qs;

assign LEDR[9:1] = 0;
assign LEDR[0] = Q;

not (Q_not, Q);
gated_D_latch M0 (.Clk(~Clock), .D(D), .Q(Qm));
gated_D_latch S0 (.Clk(Clock), .D(Qm), .Q(Qs));

endmodule