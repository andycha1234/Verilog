module part6(SW, LEDR, HEX0, HEX1);
input [9:0] SW;

output [9:0] LEDR;
output [0:6] HEX0, HEX1;

wire [0:6] seg0, seg1;
wire [5:0] S, T;
reg [5:0] Z;
reg [2:0] c;

assign S = SW[5:0];
assign LEDR[5:0] = SW[5:0];
assign LEDR[9:6] = 0;
assign HEX0 = seg0;
assign HEX1 = seg1;


//whenever there is a change in S, enter always block
always@(S) begin
	//if T is greater than 9 and less than 20, set HEX1 to 1
	if(S > 9 && S <= 19) begin
		Z = 10;
		c = 1;
	end
	else if(S >= 20 && S <= 29) begin
		Z = 20;
		c = 2;
	end
	else if(S >= 30 && S <= 39) begin
		Z = 30;
		c = 3;
	end
	else if(S >= 40 && S <= 49) begin
		Z = 40;
		c = 4;
	end
	else if(S >= 50 && S <= 59) begin
		Z = 50;
		c = 5;
	end
	else if(S >= 60 && S <= 63) begin
		Z = 60;
		c = 6;
	end
	//if T is less than 9, set HEX0 to 0
	else begin
		Z = 0;
		c = 0;
	end
end

//If T is greater than 9, then we subtract 10 to get correct value for HEX0
//If T is less than 9, then we subtract 0 to get correct value for HEX1
assign T = S - Z;
//assign W = c;

char_7seg U1 ( .C(c), .segment(seg1) );
char_7seg U2 ( .C(T[3:0]), .segment(seg0) );

endmodule