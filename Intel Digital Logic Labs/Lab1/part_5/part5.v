module part5 (SW, LEDR, HEX0, HEX1, HEX2, HEX3);
input [9:0] SW; // slide switches
output [9:0] LEDR; // red lights
output [0:6] HEX0; // 7-seg display
output [0:6] HEX1; // 7-seg display
output [0:6] HEX2; // 7-seg display
output [0:6] HEX3; // 7-seg display

wire [1:0] M0;

assign LEDR = SW;

mux_2bit_4to1 U0 (SW[9:8], SW[7:6], SW[5:4], SW[3:2], SW[1:0], M0);
char_7seg H0 (M0, HEX0, HEX1, HEX2, HEX3);

endmodule
