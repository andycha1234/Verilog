module full_adder(a, b, ci, s, co);
input a, b, ci;

output co, s;

wire mux_out;

mux2to1 G0 (.x(b), .y(ci), .s((a^b)), .m(co));

assign s = ((a^b) ^ ci);
//assign co = ((a ^ b) == 1'b1) ? ci : b;

endmodule