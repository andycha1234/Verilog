//counter for hundredths of a second
module smaller_counter (Clock, Stop, Q, E, rollover, hold);
parameter n = 4;
parameter k = 20;

input Clock, Stop, E, hold;

output [n-1:0] Q;
output rollover;

reg [n-1:0] Q;
reg rollover;

always @(posedge Clock) begin
	//stop the clock until release
	if (hold == 0) begin
		Q <= Q;
		//rollover <= 0;
	end
	//increment counter if enable = 1 from clock frequency
	else if(E == 1) begin
		//if counter is 9, reset counter to 0 and rollover back to 0
		if(Q == (k-1)) begin
			Q <= 0;
			rollover <= 0;
		end
		//when counter is 8, set rollover = 1 due to clock delay
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

endmodule