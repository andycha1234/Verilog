module mux7to1(a, b, c, d, e, f, g, s, m);
input [3:0] a, b, c, d, e, f, g;
input [2:0] s;

output reg [3:0] m;

always@(a or b or c or d or e or f or g or s) begin
	case(s)
		3'b000: m = a;		
		3'b001: m = b;		
		3'b010: m = c;		
		3'b011: m = d;		
		3'b100: m = e;		
		3'b101: m = f;
		3'b110: m = g;
		default: m = 4'b1111;
	endcase
end

endmodule