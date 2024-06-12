module part1_tb;
reg [1:0] KEY;

wire [9:0] LEDR;

part1 DUT ( .KEY(KEY), .LEDR(LEDR) );

always #10 KEY[1] = ~KEY[1];

initial begin
	KEY = 2'b00;
	#10
	KEY[0] = 1;
	#100
	KEY[0] = 0;
	#10
	$finish;
end

// Monitor the LEDR outputs
initial begin
	$monitor("Time: %0d, Reset: %b, Clock: %b, Counter: %b, Rollover: %b", $time, KEY[0], KEY[1], LEDR[4:0], LEDR[9]);
end

endmodule