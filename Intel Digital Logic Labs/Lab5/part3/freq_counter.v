module freq_counter(Clock, counter);
//50MHz frequency
input Clock;

//2^(26) = 67,108,864
//need enough space to count to 50_000_000 clock cycles so counter will be 26 bits
//output reg [25:0] counter;

//we are going from 1 second interval to 0.01 of a second, therefore 50_000_000 / 100 = 500_000 clock cycle
//2^(19) = 524,288
//need enough space to count to 500_000 clock cycles so counter will be 19 bits
output reg [18:0] counter;

always@(posedge Clock) begin
	if(counter == 500_000)
		counter = 0;
	else
		counter = counter + 1;
end

endmodule