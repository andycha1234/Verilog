module ripple_carry_adder(SW, LEDR);
//SW[8] -> cin
//SW[7-4] -> A
//SW[3:0] -> B
input [9:0] SW;

output [9:0] LEDR;

wire [3:0] a, b, s_out;
wire cout, cin;
wire [3:1] c;

assign a = SW[7:4];
assign b = SW[3:0];
assign cin = SW[8];
assign LEDR[3:0] = s_out;
assign LEDR[4] = cout;

full_adder f0 (.a(a[0]),.b(b[0]),.ci(cin),.s(s_out[0]),.co(c[1]));
full_adder f1 (.a(a[1]),.b(b[1]),.ci(c[1]),.s(s_out[1]),.co(c[2]));
full_adder f2 (.a(a[2]),.b(b[2]),.ci(c[2]),.s(s_out[2]),.co(c[3]));
full_adder f3 (.a(a[3]),.b(b[3]),.ci(c[3]),.s(s_out[3]),.co(cout));

endmodule