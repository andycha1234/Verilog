module part5(SW, LEDR, HEX0, HEX1, HEX3, HEX5);
input [9:0] SW;

output [9:0] LEDR;
output [0:6] HEX0, HEX1, HEX3, HEX5;

wire [3:0] A, B;
reg [3:0] Z;
wire cin, W;
reg c;

wire [4:0] S, T;
wire [0:6] seg0, seg1, seg3, seg5;

assign A = SW[7:4];
assign B = SW[3:0];
assign cin = SW[8];


assign LEDR[3:0] = S[3:0];
assign LEDR[4] = S[4];

assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX3 = seg3;
assign HEX5 = seg5;

//adds  both inputs and cin
assign T = A + B + cin;

//whenever there is a change in S, enter always block
always@(S) begin
	//if T is greater than 9, set HEX1 to 1
	if(T > 9) begin
		Z = 10;
		c = 1;
	end
	//if T is less than 9, set HEX0 to 0
	else begin
		Z = 0;
		c = 0;
	end
end

//If T is greater than 9, then we subtract 10 to get correct value for HEX0
//If T is less than 9, then we subtract 0 to get correct value for HEX1
assign S = T - Z;
assign W = c;

char_7seg H0( .C(S[3:0]), .segment(seg0) );
char_7seg H1( .C(W), .segment(seg1) );
char_7seg H3( .C(A), .segment(seg3) );
char_7seg H5( .C(B), .segment(seg5) );

endmodule