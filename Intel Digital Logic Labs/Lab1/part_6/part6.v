module part6 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
input [9:0] SW; // slide switches
output [9:0] LEDR; // red lights
output [0:6] HEX0; // 7-seg display
output [0:6] HEX1; // 7-seg display
output [0:6] HEX2; // 7-seg display
output [0:6] HEX3; // 7-seg display
output [0:6] HEX4; // 7-seg display
output [0:6] HEX5; // 7-seg display

wire [2:0] M0;

assign LEDR = SW;

//not enough switches on board. Three switches will be for select. Rest will be constant
mux_3bit_8to1 U0 (SW[9:7], 000, 001, 010, 011, 100, 101, M0);
char_7seg H0 (M0, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

endmodule
