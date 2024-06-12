// 2nd counter for seconds
module smaller_counter_seg4 (Clock, Stop, counter, counter2, counter3, E, Q, rollover, hold);
parameter n = 4;
parameter k = 20;

input E, Clock, Stop, counter, counter2, counter3, hold;

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
	if (E == 1) begin
		//If HEX2, HEX1, HEX0 are 9, then increment counter
		if(counter == 1 && counter2 == 1 && counter3 == 1) begin
			if(Q == (k-1)) begin
				Q <= 0;
				rollover <= 0;
			end
			else if (Q == (k-2)) begin
			Q <= Q + 1;
			rollover <= 1;
			end
			else begin
				Q <= Q + 1;
				rollover <= 0;
			end
		end
	end
end

endmodule