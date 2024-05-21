// implements a 7-segment decoder for d, E, 1 and 0
module char_7seg (C, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
input [2:0] C; // input code
output wire [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // output 7-seg code

reg [0:6] segment0, segment1, segment2, segment3, segment4, segment5;

assign HEX0 = segment0;
assign HEX1 = segment1;
assign HEX2 = segment2;
assign HEX3 = segment3;
assign HEX4 = segment4;
assign HEX5 = segment5;

always@(C) begin
	if(C == 3'b000) begin
		//display: blank, blank, d, E, 1, 0
		segment0 = 7'b0000001;
		segment1 = 7'b1001111;
		segment2 = 7'b0110000;
		segment3 = 7'b1000010;
		segment4 = 7'b1111111;
		segment5 = 7'b1111111;
	end
	else if(C == 3'b001) begin
		//display: blank, d, E, 1, 0, blank
		segment0 = 7'b1111111;
		segment1 = 7'b0000001;
		segment2 = 7'b1001111;
		segment3 = 7'b0110000;
		segment4 = 7'b1000010;
		segment5 = 7'b1111111;
	end
	else if(C == 3'b010) begin
		//display: d, E, 1, 0, blank, blank
		segment0 = 7'b1111111;
		segment1 = 7'b1111111;
		segment2 = 7'b0000001;
		segment3 = 7'b1001111;
		segment4 = 7'b0110000;
		segment5 = 7'b1000010;
	end
	else if(C == 3'b011) begin
		//display: E, 1, 0, blank, blank, d
		segment0 = 7'b1000010;
		segment1 = 7'b1111111;
		segment2 = 7'b1111111;
		segment3 = 7'b0000001;
		segment4 = 7'b1001111;
		segment5 = 7'b0110000;
	end
	else if(C == 3'b100) begin
		//display: 1, 0, blank, blank, d, E
		segment0 = 7'b0110000;
		segment1 = 7'b1000010;
		segment2 = 7'b1111111;
		segment3 = 7'b1111111;
		segment4 = 7'b0000001;
		segment5 = 7'b1001111;
	end
	else if(C == 3'b101) begin
		//display: 0, blank, blank, d, E, 1
		segment0 = 7'b1001111;
		segment1 = 7'b0110000;
		segment2 = 7'b1000010;
		segment3 = 7'b1111111;
		segment4 = 7'b1111111;
		segment5 = 7'b0000001;
	end
end


endmodule