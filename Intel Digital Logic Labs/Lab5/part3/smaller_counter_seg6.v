// 2nd counter for min
module smaller_counter_seg6 (Clock, Stop, counter, counter2, counter3, counter4, counter5, E, Q, set, set_num, hold);
parameter n = 4;
parameter k = 20;

input E, Clock, Stop, counter, counter2, counter3, counter4, counter5, set, hold;
input [2:0] set_num;

output [n-1:0] Q;

reg [n-1:0] Q;

always @(posedge Clock) begin
	//if KEY0 is pressed, stop counter
	if (hold == 0) begin
		Q <= Q;
		//rollover <= 0;
	end
	else if(set == 0) begin
		Q <= set_num;
	end
	else if (E == 1) begin
		//If HEX4, HEX3, HEX2, HEX1, HEX0 are 9, then increment counter
		if(counter == 1 && counter2 == 1 && counter3 == 1 && counter4 == 1 && counter5 == 1) begin
			if(Q == (k-1))
				Q <= 0;
			else
				Q <= Q + 1;
		end
	end
end

endmodule