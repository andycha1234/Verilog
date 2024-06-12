module part3 (clk, KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
input clk;
input [5:0] SW;
//KEY1 preset the minute part
//KEY0 stop the clock when pressed. Continue the clock when KEY0 is released
input [1:0] KEY;

output [9:0] LEDR;
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

wire stop;
wire set;
wire [5:0] set_num;
wire [2:0] send_num;
//wire [25:0] count;
wire [18:0] count;
wire E;
wire [0:6] seg0, seg1, seg2, seg3, seg4, seg5;
wire [3:0] slow_count0, slow_count1, slow_count2, slow_count3, slow_count4, slow_count5;
wire roll0, roll1, roll2, roll3, roll4;

assign set_num = SW[5:0];
assign hold = KEY[0];
assign set = KEY[1];
assign LEDR[9] = set;
assign LEDR[8] = hold;
assign LEDR[7] = 0;
assign LEDR[6] = E;
assign LEDR[5:0] = SW[5:0];
assign HEX0 = seg0;
assign HEX1 = seg1;
assign HEX2 = seg2;
assign HEX3 = seg3;
assign HEX4 = seg4;
assign HEX5 = seg5;

freq_counter U0 ( .Clock(clk), .counter(count) );
nor_gate U1 ( .counter(count), .E(E) );
//counter HEX0
smaller_counter U2 ( .Clock(clk), .Stop(stop), .Q(slow_count0), .E(E), .rollover(roll0), .hold(hold) );
	defparam U2.n = 4;
	defparam U2.k = 10;
//counter HEX1
smaller_counter_seg2 U3 ( .Clock(clk), .Stop(stop), .counter(roll0), .E(E), .Q(slow_count1), .rollover(roll1), .hold(hold) );
	defparam U3.n = 4;
	defparam U3.k = 10;
//counter HEX2
smaller_counter_seg3 U4 ( .Clock(clk), .Stop(stop), .counter(roll0), .counter2(roll1), .E(E), .Q(slow_count2), .rollover(roll2), .hold(hold) );
	defparam U4.n = 4;
	defparam U4.k = 10;
//counter HEX3
smaller_counter_seg4 U5 ( .Clock(clk), .Stop(stop), .counter(roll0), .counter2(roll1), .counter3(roll2), .E(E), .Q(slow_count3), .rollover(roll3), .hold(hold) );
	defparam U5.n = 4;
	defparam U5.k = 6;
//counter HEX4
smaller_counter_seg5 U6 ( .Clock(clk), .Stop(stop), .counter(roll0), .counter2(roll1), .counter3(roll2), .counter4(roll3), .E(E), .Q(slow_count4), .rollover(roll4), .set(set), .set_num(set_num), .send_num(send_num), .hold(hold) );
	defparam U6.n = 4;
	defparam U6.k = 10;
//counter HEX5
smaller_counter_seg6 U7 ( .Clock(clk), .Stop(stop), .counter(roll0), .counter2(roll1), .counter3(roll2), .counter4(roll3), .counter5(roll4), .set(set), .E(E), .Q(slow_count5), .set_num(send_num), .hold(hold) );
	defparam U7.n = 4;
	defparam U7.k = 6;
	
char_7seg U8  ( .C(slow_count0), .segment(seg0) );
char_7seg U9  ( .C(slow_count1), .segment(seg1) );
char_7seg U10 ( .C(slow_count2), .segment(seg2) );
char_7seg U11 ( .C(slow_count3), .segment(seg3) );
char_7seg U12 ( .C(slow_count4), .segment(seg4) );
char_7seg U13 ( .C(slow_count5), .segment(seg5) );

endmodule