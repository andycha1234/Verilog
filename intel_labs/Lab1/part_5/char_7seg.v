// implements a 7-segment decoder for d, E, 1 and 0
module char_7seg (C, HEX0, HEX1, HEX2, HEX3);
input [1:0] C; // input code
output wire [0:6] HEX0, HEX1, HEX2, HEX3; // output 7-seg code

reg [0:6] segment0, segment1, segment2, segment3;

assign HEX0 = segment0;
assign HEX1 = segment1;
assign HEX2 = segment2;
assign HEX3 = segment3;

always@(C) begin
	if(C == 2'b00) begin
		//display: dE10
		segment0 = 7'b0000001;
		segment1 = 7'b1001111;
		segment2 = 7'b0110000;
		segment3 = 7'b1000010;
	end
	else if(C == 2'b01) begin
		//display; E10d
		segment0 = 7'b1000010;
		segment1 = 7'b0000001;
		segment2 = 7'b1001111;
		segment3 = 7'b0110000;
	end
	else if(C == 2'b10) begin
		//display: 10dE
		segment0 = 7'b0110000;
		segment1 = 7'b1000010;
		segment2 = 7'b0000001;
		segment3 = 7'b1001111;
	end
	else begin
		//display: 0dE1
		segment0 = 7'b1001111;
		segment1 = 7'b0110000;
		segment2 = 7'b1000010;
		segment3 = 7'b0000001;
	end
end


endmodule