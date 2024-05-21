module counter(Clock, counter);
//50MHz frequency
//For 25_000_000 clock cycle will be HIGH
//For 25_000_000 clock cycle will be LOW
input Clock;

//2^(15) = 32,768
//2^(26) = 67,108,864
//need enough space to count to 25_000_000 clock cycles
output reg [25:0] counter;

always@(posedge Clock) begin
	if(counter == 50_000_000)
		counter = 0;
	else
		counter = counter + 1;
end

endmodule