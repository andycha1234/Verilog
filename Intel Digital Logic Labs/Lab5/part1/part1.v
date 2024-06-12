module part1 (KEY, LEDR);

//KEY0 and KEY1 for reset and clock
input [1:0] KEY;

output [9:0] LEDR;

wire clk;
wire reset;
wire [4:0] counter;
wire rollover;

assign clk = KEY[1];
assign reset = KEY[0];

assign LEDR[9] = rollover;
assign LEDR[8:5] = 0;
assign LEDR[4:0] = counter;

counter eight_bit ( .Clock(clk), .Reset_n(reset), .Q(counter), .rollover(rollover) );
	defparam eight_bit.n = 5;
	defparam eight_bit.k = 20;

endmodule