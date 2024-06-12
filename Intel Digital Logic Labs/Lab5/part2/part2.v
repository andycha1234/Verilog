module part2(clk, KEY0, HEX0, HEX1, HEX2);
input clk;
input KEY0;

output [0:6] HEX0, HEX1, HEX2;

wire reset;
wire E;
wire roll, roll2;
wire [3:0] slow_count0, slow_count1, slow_count2;
wire [0:6] seg0, seg1, seg2;
wire  [25:0] count;

assign reset = KEY0;
assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX2 = seg2;

freq_counter U0 ( .Clock(clk), .counter(count) );
nor_gate U1 ( .counter(count), .E(E) );

smaller_counter U2( .Clock(clk), .Reset_n(reset), .E(E), .Q(slow_count0), .rollover(roll) );
	defparam U2.n = 4;
	defparam U2.k = 10;
smaller_counter_seg2 U3 ( .Clock(clk), .Reset_n(reset), .counter(roll), .E(E), .Q(slow_count1), .rollover(roll2) );
	defparam U3.n = 4;
	defparam U3.k = 10;
smaller_counter_seg3 U4 ( .Clock(clk), .Reset_n(reset), .counter(roll2), .counter2(roll), .E(E), .Q(slow_count2), );
	defparam U4.n = 4;
	defparam U4.k = 10;

char_7seg U5 ( .C(slow_count0), .segment(seg0) );	
char_7seg U6 ( .C(slow_count1), .segment(seg1) );
char_7seg U7 ( .C(slow_count2), .segment(seg2) );

endmodule