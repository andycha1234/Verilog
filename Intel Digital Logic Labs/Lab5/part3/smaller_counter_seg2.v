//counter for seconds
module smaller_counter_seg2 (Clock, Stop, counter, E, Q, rollover, hold);
parameter n = 4;
parameter k = 20;

input E, Clock, Stop, counter, hold;

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
	//increment counter as usual. 
	else if (E == 1) begin
		//if rollover from HEX0, then increment
		if(counter == 1) begin
			//when counter is 9, reset rollover and set counter back to 0
			if(Q == (k-1)) begin
				Q <= 0;
				rollover <= 0;
			end
			//rollover at 8 instead of 9 to due to clock delay.
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