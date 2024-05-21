module part4(clk, HEX0, HEX1, HEX2, HEX3);
input clk;

output [0:6] HEX0; // 7-seg display
output [0:6] HEX1; // 7-seg display
output [0:6] HEX2; // 7-seg display
output [0:6] HEX3; // 7-seg display

wire E;
wire [25:0] Q_out;
wire [1:0] slow_count;

counter H0 (.Clock(clk), .counter(Q_out) );

nor_gate H1( .counter(Q_out), .E(E) );

smaller_counter H2( .Clock(clk), .E(E), .Q(slow_count) );

char_7seg H3 (slow_count, HEX0, HEX1, HEX2, HEX3);

endmodule