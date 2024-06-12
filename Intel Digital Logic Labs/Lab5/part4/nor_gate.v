module nor_gate(counter, E);
//input [25:0] counter;
input [24:0] counter;

output wire E;

//unary operator
//acts as a reduction operator, OR every bit
assign E = ~(|counter);

endmodule