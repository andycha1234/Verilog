module counter(Clock, counter);
//50MHz frequency
input Clock;

//2^(26) = 67,108,864
//need enough space to count to 50_000_000 clock cycles so counter will be 26 bits
output reg [25:0] counter;

always@(posedge Clock) begin
	if(counter == 50_000_000)
		counter = 0;
	else
		counter = counter + 1;
end

endmodule