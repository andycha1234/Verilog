module mux2to1(x, y, s, m, led);
input [3:0] x, y;
input s;
output [3:0] m;
output [9:4] led;

assign m[0] = (~s&x[0]) | (s&y[0]);
assign m[1] = (~s&x[1]) | (s&y[1]);
assign m[2] = (~s&x[2]) | (s&y[2]);
assign m[3] = (~s&x[3]) | (s&y[3]);

assign led[9] = s;
assign led[8:4] = 0;

endmodule