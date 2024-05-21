// implements a 2-bit wide 4-to-1 multiplexer
module mux_3bit_8to1 (S, U, V, W, X, Y, Z, M);
input [2:0] S, U, V, W, X, Y, Z;
output reg [2:0] M;

always@(U or V or W or X or Y or Z or S)
begin
	case(S)
		3'b000: M <= U;
		3'b001: M <= V;
		3'b010: M <= W;
		3'b011: M <= X;
		3'b100: M <= Y;
		3'b101: M <= Z;
	endcase
end

endmodule