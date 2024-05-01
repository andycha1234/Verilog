module D_latch (D, Clk, Q, not_Q);
input D, Clk;
output not_Q;
output reg Q;

assign not_Q = ~(Q);

always @ (D, Clk) begin
	if (Clk)
		Q = D;
end
endmodule