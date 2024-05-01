module part5 (SW, LEDR, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
input [7:0] SW;
//KEY[1] = Clk
//KEY[0] = RST
input [1:0] KEY;
output [9:0] LEDR;
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

wire rst, clk;
wire [7:0] G, H, T;
wire [0:6] seg0, seg1, seg2, seg3, seg4, seg5;

reg [7:0] S;
reg count, cout;
reg [7:0] A, B;
reg [7:0] Z, X, Y, c, e, f;

assign rst = KEY[0];
assign clk = KEY[1];

assign LEDR[9:1] = 0;
assign LEDR[0] = cout;
assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX2 = seg2;
assign HEX3 = seg3;
assign HEX4 = seg4;
assign HEX5 = seg5;

//posedge D flip flop
//if clock goes from low to high OR when reset goes from high to low
always @(posedge clk, negedge rst) begin
	if(rst == 1'b0) begin
		S = 0; 
		count = 0;
		A = 0;
		B = 0;
	end
	else begin
		if(count == 0) begin
			A = SW[7:0];
			S = S + A; 
			count <= count + 1;
		end
		else if(count == 1) begin
			B = SW[7:0];
			S = S + B;
		end
	end
end 

//whenever there is a change in A, enter always block
always@(A) begin
	//if A is within 10-19, set HEX1 to 1
	if(A > 9 && A <= 19) begin
		X = 10;
		e = 1;
	end
	//if A is within 20-29, set HEX1 to 2
	else if(A >= 20 && A <= 29) begin
		X = 20;
		e = 2;
	end
	//if A is within 30-39, set HEX1 to 3
	else if(A >= 30 && A <= 39) begin
		X = 30;
		e = 3;
	end
	//if A is within 40-49, set HEX1 to 4
	else if(A >= 40 && A <= 49) begin
		X = 40;
		e = 4;
	end
	//if A is within 50-59, set HEX1 to 5
	else if(A >= 50 && A <= 59) begin
		X = 50;
		e = 5;
	end
	//if A is within 60-69, set HEX1 to 6
	else if(A >= 60 && A <= 69) begin
		X = 60;
		e = 6;
	end
	//if A is within 70-79, set HEX1 to 7
	else if(A >= 70 && A <= 79) begin
		X = 70;
		e = 7;
	end
	//if A is within 80-89, set HEX1 to 8
	else if(A >= 80 && A <= 89) begin
		X = 80;
		e = 8;
	end
	//if A is within 90-99, set HEX1 to 9
	else if(A >= 90 && A <= 99) begin
		X = 90;
		e = 9;
	end
	//if A is 100+, set HEX1 to BLANK
	else if(A >= 100) begin
		X = 100;
		e = 10;
	end
	//if A is less than 9, set HEX0 to 0
	else begin
		X = 0;
		e = 0;
	end
end

//If A is greater than 9, then we subtract 10 to get correct value for HEX0
//If A is less than 9, then we subtract 0 to get correct value for HEX1
assign G = A - X;

char_7seg H0( .C(e), .segment(seg1) );
char_7seg H1( .C(G[3:0]), .segment(seg0) );

//whenever there is a change in B, enter always block
always@(B) begin
	//if B is within 10-19, set HEX1 to 1
	if(B > 9 && B <= 19) begin
		Y = 10;
		f = 1;
	end
	//if B is within 20-29, set HEX1 to 2
	else if(B >= 20 && B <= 29) begin
		Y = 20;
		f = 2;
	end
	//if B is within 30-39, set HEX1 to 3
	else if(B >= 30 && B <= 39) begin
		Y = 30;
		f = 3;
	end
	//if B is within 40-49, set HEX1 to 4
	else if(B >= 40 && B <= 49) begin
		Y = 40;
		f = 4;
	end
	//if B is within 50-59, set HEX1 to 5
	else if(B >= 50 && B <= 59) begin
		Y = 50;
		f = 5;
	end
	//if B is within 60-69, set HEX1 to 6
	else if(B >= 60 && B <= 69) begin
		Y = 60;
		f = 6;
	end
	//if B is within 70-79, set HEX1 to 7
	else if(B >= 70 && B <= 79) begin
		Y = 70;
		f = 7;
	end
	//if B is within 80-89, set HEX1 to 8
	else if(B >= 80 && B <= 89) begin
		Y = 80;
		f = 8;
	end
	//if B is within 90-99, set HEX1 to 9
	else if(B >= 90 && B <= 99) begin
		Y = 90;
		f = 9;
	end
	//if B is 100+, set HEX1 to BLANK
	else if(B >= 100) begin
		Y = 100;
		f = 10;
	end
	//if T is less than 9, set HEX0 to 0
	else begin
		Y = 0;
		f = 0;
	end
end

//If B is greater than 9, then we subtract 10 to get correct value for HEX0
//If B is less than 9, then we subtract 0 to get correct value for HEX1
assign H = B - Y;

char_7seg H2( .C(f), .segment(seg3) );
char_7seg H3( .C(H[3:0]), .segment(seg2) );

//whenever there is a change in S, enter always block
always@(S) begin
	if(S > 100) 
		cout = 1'b1;
	else
		cout = 1'b0;
	
	//if S is within 10-19, set HEX1 to 1
	if(S > 9 && S <= 19) begin
		Z = 10;
		c = 1;
	end
	//if S is within 20-29, set HEX1 to 2
	else if(S >= 20 && S <= 29) begin
		Z = 20;
		c = 2;
	end
	//if S is within 30-39, set HEX1 to 3
	else if(S >= 30 && S <= 39) begin
		Z = 30;
		c = 3;
	end
	//if T is within 40-49, set HEX1 to 4
	else if(S >= 40 && S <= 49) begin
		Z = 40;
		c = 4;
	end
	//if S is within 50-59, set HEX1 to 5
	else if(S >= 50 && S <= 59) begin
		Z = 50;
		c = 5;
	end
	//if S is within 60-69, set HEX1 to 6
	else if(S >= 60 && S <= 69) begin
		Z = 60;
		c = 6;
	end
	//if S is within 70-79, set HEX1 to 7
	else if(S >= 70 && S <= 79) begin
		Z = 70;
		c = 7;
	end
	//if S is within 80-89, set HEX1 to 8
	else if(S >= 80 && S <= 89) begin
		Z = 80;
		c = 8;
	end
	//if S is within 90-99, set HEX1 to 9
	else if(S >= 90 && S <= 99) begin
		Z = 90;
		c = 9;
	end
	//if S is 100+, set HEX1 to BLANK
	else if(S >= 100) begin
		Z = 100;
		c = 10;
	end
	//if S is less than 9, set HEX0 to 0
	else begin
		Z = 0;
		c = 0;
	end
end

//If S is greater than 9, then we subtract 10 to get correct value for HEX0
//If S is less than 9, then we subtract 0 to get correct value for HEX1
assign T = S - Z;

char_7seg H4( .C(c), .segment(seg5) );
char_7seg H5( .C(T[3:0]), .segment(seg4) );

endmodule