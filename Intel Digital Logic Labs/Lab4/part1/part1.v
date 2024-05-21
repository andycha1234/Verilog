module part1 (SW, LEDR, KEY0, HEX0, HEX1);
input [1:0] SW;
input KEY0;

output [9:0] LEDR;
output [0:6] HEX0, HEX1;
//output [7:0] Q, not_Q;

wire Enable, Clock, Clear;
wire [7:0] and_out;
wire [0:6] seg0, seg1;
wire [7:0] T;
wire[7:0] Q_out;

reg [7:0] Z;
reg [3:0] c;

assign Clear = SW[0];
assign Enable = SW[1];
assign Clock = KEY0;
//assign Q = Q_out;

assign HEX0 = seg0;
assign HEX1 = seg1;
assign LEDR[1] = SW[1];
assign LEDR[0] = SW[0];
assign LEDR[9:2] = 0;


//whenever there is a change in Q_out, enter always block
always@(Q_out) begin
	//if Q_out is within 10-19, set HEX1 to 1
	if(Q_out > 9 && Q_out <= 19) begin
		Z = 10;
		c = 1;
	end
	//if Q_out is within 20-29, set HEX1 to 2
	else if(Q_out >= 20 && Q_out <= 29) begin
		Z = 20;
		c = 2;
	end
	//if Q_out is within 30-39, set HEX1 to 3
	else if(Q_out >= 30 && Q_out <= 39) begin
		Z = 30;
		c = 3;
	end
	//if Q_out is within 40-49, set HEX1 to 4
	else if(Q_out >= 40 && Q_out <= 49) begin
		Z = 40;
		c = 4;
	end
	//if Q_out is within 50-59, set HEX1 to 5
	else if(Q_out >= 50 && Q_out <= 59) begin
		Z = 50;
		c = 5;
	end
	//if Q_out is within 60-69, set HEX1 to 6
	else if(Q_out >= 60 && Q_out <= 69) begin
		Z = 60;
		c = 6;
	end
	//if Q_out is within 70-79, set HEX1 to 7
	else if(Q_out >= 70 && Q_out <= 79) begin
		Z = 70;
		c = 7;
	end
	//if Q_out is within 80-89, set HEX1 to 8
	else if(Q_out >= 80 && Q_out <= 89) begin
		Z = 80;
		c = 8;
	end
	//if Q_out is within 90-99, set HEX1 to 9
	else if(Q_out >= 90 && Q_out <= 99) begin
		Z = 90;
		c = 9;
	end
	//if S is 100+, set HEX1 to BLANK
	else if(Q_out >= 100) begin
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
assign T = Q_out - Z;

char_7seg H4( .C(c), .segment(seg1) );
char_7seg H5( .C(T[3:0]), .segment(seg0) );


T_Flipflop U0 ( .T(Enable), .clk(Clock), .rst(Clear), .Q(Q_out[0]) );
and (and_out[0],Q_out[0], Enable);

T_Flipflop U1 ( .T(and_out[0]), .clk(Clock), .rst(Clear), .Q(Q_out[1]) );
and (and_out[1],Q_out[1], and_out[0]);

T_Flipflop U2 ( .T(and_out[1]), .clk(Clock), .rst(Clear), .Q(Q_out[2]) );
and (and_out[2],Q_out[2], and_out[1]);

T_Flipflop U3 ( .T(and_out[2]), .clk(Clock), .rst(Clear), .Q(Q_out[3]) );
and (and_out[3],Q_out[3], and_out[2]);

T_Flipflop U4 ( .T(and_out[3]), .clk(Clock), .rst(Clear), .Q(Q_out[4]) );
and (and_out[4],Q_out[4], and_out[3]);

T_Flipflop U5 ( .T(and_out[4]), .clk(Clock), .rst(Clear), .Q(Q_out[5]) );
and (and_out[5],Q_out[5], and_out[4]);

T_Flipflop U6 ( .T(and_out[5]), .clk(Clock), .rst(Clear), .Q(Q_out[6]) );
and (and_out[6],Q_out[6], and_out[5]);

T_Flipflop U7 ( .T(and_out[6]), .clk(Clock), .rst(Clear), .Q(Q_out[7]) );
and (and_out[7],Q_out[7], and_out[6]);

endmodule