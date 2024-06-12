module freq_counter_half_sec(Clock, counter);
//50MHz frequency
input Clock;

//2^(26) = 67,108,864
//need enough space to count to 50_000_000 clock cycles so counter will be 26 bits
//output reg [25:0] counter;

//we are going from 1 second interval to 0.01 of a second, therefore 50_000_000 / 0.5 = 25_000_000 clock cycle
//2^(25) = 33,554,432
//need enough space to count to 500_000 clock cycles so counter will be 19 bits
output reg [24:0] counter;

always@(posedge Clock) begin
	if(counter == 25_000_000)
		counter = 0;
	else
		counter = counter + 1;
end

endmodule