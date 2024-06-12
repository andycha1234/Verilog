// 1st counter for seconds
module smaller_counter_seg3 (Clock, Stop, counter, counter2, E, Q, rollover, hold);
parameter n = 4;
parameter k = 20;

input E, Clock, Stop, counter, counter2, hold;

output [n-1:0] Q;
output rollover;

reg [n-1:0] Q;
reg rollover;

always @(posedge Clock) begin
	//if KEY0 is pressed, stop counter
	if (hold == 0) begin
		Q <= Q;
		//rollover <= 0;
	end
	else if (E == 1) begin
		// if HEX1 and HEX0 reaches 9, then increment
		if(counter == 1 && counter2 == 1) begin
			//if counter = 9, then reset counter to 0 and rollover back to 0
			if(Q == (k-1)) begin
				Q <= 0;
				rollover <= 0;
			end
			//if counter is 8, set rollover = 1 due to clock delay
			else if (Q == (k-2)) begin
			Q <= Q + 1;
			rollover <= 1;
			end
			//increment counter
			else begin
				Q <= Q + 1;
				rollover <= 0;
			end
		end
	end
end

endmodule