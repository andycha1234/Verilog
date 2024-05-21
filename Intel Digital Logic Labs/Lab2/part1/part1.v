module part1(HEX0, HEX1, SW, LEDR);
input [9:0] SW;

output [6:0] HEX0, HEX1;
output [9:0] LEDR;

wire [3:0] seg1, seg0;

reg [6:0] segment0, segment1;

assign seg1 = SW[7:4];
assign seg0 = SW[3:0];
assign HEX0 = segment0;
assign HEX1 = segment1;
assign LEDR = SW;

always@(SW) begin
	case(seg0) 
		4'b0000: segment0 <= 7'b1000000;	//0
		4'b0001: segment0 <= 7'b1111001;	//1
		4'b0010: segment0 <= 7'b0100100;	//2
		4'b0011: segment0 <= 7'b0110000;	//3
		4'b0100: segment0 <= 7'b0011001;	//4
		4'b0101: segment0 <= 7'b0010010;	//5
		4'b0110: segment0 <= 7'b0000010;	//6
		4'b0111: segment0 <= 7'b1111000;	//7
		4'b1000: segment0 <= 7'b0000000;	//8
		4'b1001: segment0 <= 7'b0010000;	//9
		default: segment0 <= 7'b1111111;
	endcase
end

always@(SW) begin
	case(seg1) 
		4'b0000: segment1 <= 7'b1000000;	//0
		4'b0001: segment1 <= 7'b1111001;	//1
		4'b0010: segment1 <= 7'b0100100;	//2
		4'b0011: segment1 <= 7'b0110000;	//3
		4'b0100: segment1 <= 7'b0011001;	//4
		4'b0101: segment1 <= 7'b0010010; //5
		4'b0110: segment1 <= 7'b0000010;	//6
		4'b0111: segment1 <= 7'b1111000;	//7
		4'b1000: segment1 <= 7'b0000000;	//8
		4'b1001: segment1 <= 7'b0010000;	//9
		default: segment1 <= 7'b1111111;
	endcase
end

endmodule