module sevensegment(c ,hex0);
input [1:0] c;
output wire [6:0] hex0;

reg [6:0] segments;

assign hex0 = segments;

always@(c) begin
	if(c == 2'b00)
		//display: d
		segments = 7'b0100001;
	else if(c == 2'b01)
		//display; E
		segments = 7'b0000110;
	else if(c == 2'b10)
		//display: 1
		segments = 7'b1111001;
	else
		//display: 0
		segments = 7'b1000000;
end

endmodule