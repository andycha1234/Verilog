// implements a 7-segment decoder for d, E, 1 and 0
module char_7seg (C, segment);
input [3:0] C; // input code
output reg [0:6] segment; // output 7-seg code

always@(C) begin
	case(C)
		//display 0
		4'b0000: segment = 7'b0000001;
		//display 1
		4'b0001: segment = 7'b1001111;
		//display 2
		4'b0010: segment = 7'b0010010;
		//display 3
		4'b0011: segment = 7'b0000110;
		//display 4
		4'b0100: segment = 7'b1001100;
		//display 5
		4'b0101: segment = 7'b0100100;
		//display 6
		4'b0110: segment = 7'b0100000;
		//display 7
		4'b0111: segment = 7'b0001111;
		//display 8
		4'b1000: segment = 7'b0000000;
		//display 9
		4'b1001: segment = 7'b0000100;
		//display X otherwise
		default: segment = 7'b1001000;
	endcase
end

endmodule