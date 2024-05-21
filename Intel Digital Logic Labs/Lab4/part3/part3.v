module part3(clk, HEX0);
input clk;

output [0:6] HEX0;

wire [0:6] seg0;
wire E;
wire [25:0] Q_out;
wire [3:0] slow_count;

assign HEX0 = seg0;

counter H0 (.Clock(clk), .counter(Q_out) );

nor_gate H1( .counter(Q_out), .E(E) );

smaller_counter H2( .Clock(clk), .E(E), .Q(slow_count) );

char_7seg H3( .C(slow_count[3:0]), .segment(seg0) );

endmodule