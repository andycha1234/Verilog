module smaller_counter_seg2 (Clock, Reset_n, counter, E, Q, rollover);
parameter n = 4;
parameter k = 20;

input E, Clock, Reset_n, counter;

output [n-1:0] Q;
output rollover;

reg [n-1:0] Q;
reg rollover;

always @(posedge Clock, negedge Reset_n) begin
	if (!Reset_n) begin
		Q <= 0;
		rollover <= 0;
	end
	else if (E == 1) begin
		if(counter == 1) begin
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