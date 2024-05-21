// implements a 2-bit wide 4-to-1 multiplexer
module mux_2bit_4to1 (S, U, V, W, X, M);
input [1:0] S, U, V, W, X;
output reg [1:0] M;

always@(U or V or W or X or S)
begin
	case(S)
		2'b00: M <= U;
		2'b01: M <= V;
		2'b10: M <= W;
		2'b11: M <= X;
	endcase
end

endmodule