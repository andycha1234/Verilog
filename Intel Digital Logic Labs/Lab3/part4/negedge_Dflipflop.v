module negedge_Dflipflop (D, Clk, Q, not_Q);
input D, Clk;
output not_Q;
output reg Q;

assign not_Q = ~(Q);

always @ (negedge Clk) begin
	Q <= D;
end
endmodule