module part2 (SW, KEY0, LEDR, HEX0, HEX1, HEX2, HEX3);
input [1:0] SW;
input KEY0;

output [9:0] LEDR;
output [0:6] HEX0, HEX1, HEX2, HEX3;

wire Enable, Clock, Clear;
wire [0:6] seg0, seg1, seg2, seg3;
//wire [15:0] T;

reg [15:0] T, Z, x, y, w,v;
reg [3:0] c;
reg [15:0] Q;

assign Clear = SW[0];
assign Enable = SW[1];
assign Clock = KEY0;

assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX2 = seg2;
assign HEX3 = seg3;
assign LEDR[1] = SW[1];
assign LEDR[0] = SW[0];
assign LEDR[9:2] = 0;

//whenever there is a change in Clock(KEY0) or if reset goes HIGH->LOW, enter always block
always@(posedge KEY0, negedge SW[0]) begin
	if(SW[0] == 0)
		Q <= 0;
	else
		Q <= Q+1;
end

//7 segment display
//whenever there is a change in Q, enter always block
always@(Q) begin
	T = Q;
	if(T > 999 && T <= 1999) begin
		w = 1;
		v = 1000;
	end
	else if(T >= 2000 && T <= 2999) begin
		w = 2;
		v = 2000;
	end
	else if(T >= 3000 && T <= 3999) begin
		w = 3;
		v = 3000;
	end
	else if(T >= 4000 && T <= 4999) begin
		w = 4;
		v = 4000;
	end
	else if(T >= 5000 && T <= 5999) begin
		w = 5;
		v = 5000;
	end
	else if(T >= 6000 && T <= 6999) begin
		w = 6;
		v = 6000;
	end
	else if(T >= 7000 && T <= 7999) begin
		w = 7;
		v = 7000;
	end
	else if(T >= 8000 && T <= 8999) begin
		w = 8;
		v = 8000;
	end
	else if(T >= 9000 && T <= 9999) begin
		w = 9;
		v = 9000;
	end
	else begin
		w = 0;
		v = 0;
	end
	
	T = T - v;
	
	if(T > 99 && T <= 199) begin
		x = 1;
		y = 100;
	end
	else if(T >= 200 && T <= 299) begin
		x = 2;
		y = 200;
	end
	else if(T >= 300 && T <= 399) begin
		x = 3;
		y = 300;
	end
	else if(T >= 400 && T <= 499) begin
		x = 4;
		y = 400;
	end
	else if(T >= 500 && T <= 599) begin
		x = 5;
		y = 500;
	end
	else if(T >= 600 && T <= 699) begin
		x = 6;
		y = 600;
	end
	else if(T >= 700 && T <= 799) begin
		x = 7;
		y = 700;
	end
	else if(T >= 800 && T <= 899) begin
		x = 8;
		y = 800;
	end
	else if(T >= 900 && T <= 999) begin
		x = 9;
		y = 900;
	end
	else begin
		x = 0;
		y = 0;
	end
	
	T = T - y;
	
	//if Q is within 10-19, set HEX1 to 1
	if(T > 9 && T <= 19) begin
		Z = 10;
		c = 1;
	end
	//if Q is within 20-29, set HEX1 to 2
	else if(T >= 20 && T <= 29) begin
		Z = 20;
		c = 2;
	end
	//if Q is within 30-39, set HEX1 to 3
	else if(T >= 30 && T <= 39) begin
		Z = 30;
		c = 3;
	end
	//if Q is within 40-49, set HEX1 to 4
	else if(T >= 40 && T <= 49) begin
		Z = 40;
		c = 4;
	end
	//if Q is within 50-59, set HEX1 to 5
	else if(T >= 50 && T <= 59) begin
		Z = 50;
		c = 5;
	end
	//if Q is within 60-69, set HEX1 to 6
	else if(T >= 60 && T <= 69) begin
		Z = 60;
		c = 6;
	end
	//if Q is within 70-79, set HEX1 to 7
	else if(T >= 70 && T <= 79) begin
		Z = 70;
		c = 7;
	end
	//if Q is within 80-89, set HEX1 to 8
	else if(T >= 80 && T <= 89) begin
		Z = 80;
		c = 8;
	end
	//if Q is within 90-99, set HEX1 to 9
	else if(T >= 90 && T <= 99) begin
		Z = 90;
		c = 9;
	end
	//if Q is less than 9, set HEX0 to 0
	else begin
		Z = 0;
		c = 0;
	end
	
	T = T - Z;
	
end

//If Q is greater than 9, then we subtract by 10s to get correct value for HEX0
//use c to display for HEX1. 
//use x to display for HEX2. 
//use w to display for HEX3. 
//assign T = Q - v - y - Z;

char_7seg H3( .C(w), .segment(seg3) );
char_7seg H2( .C(x), .segment(seg2) );
char_7seg H1( .C(c), .segment(seg1) );
char_7seg H0( .C(T[3:0]), .segment(seg0) );

endmodule