module mux4to1 (u, v, w, x, s, m, led);
input [1:0] u, v, w, x, s;
output reg [1:0] m;
output [9:2] led;

assign led[9:2] = 0;

always@(u or v or w or x or s)
begin
	case(s)
		2'b00: m <= u;
		2'b01: m <= v;
		2'b10: m <= w;
		2'b11: m <= x;
	endcase
end

endmodule