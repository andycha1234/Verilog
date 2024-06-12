module smaller_counter_seg3 (Clock, Reset_n, counter, counter2, E, Q);
parameter n = 4;
parameter k = 20;

input E, Clock, Reset_n, counter, counter2;

output [n-1:0] Q;

reg [n-1:0] Q;

always @(posedge Clock, negedge Reset_n) begin
	if (!Reset_n)
		Q <= 0;
	else if (E == 1) begin
		if(counter == 1 && counter2 == 1)
			Q <= Q + 1;
		else if (Q == (k-1))
			Q <= 0;
	end
end

endmodule