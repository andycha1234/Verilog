module smaller_counter (Clock, Reset_n, Q, E, rollover);
parameter n = 4;
parameter k = 20;

input Clock, Reset_n, E;

output [n-1:0] Q;
output rollover;

reg [n-1:0] Q;
reg rollover;

always @(posedge Clock, negedge Reset_n) begin
	if (!Reset_n) begin
		Q <= 0;
		rollover <= 0;
	end
	else if(E == 1) begin
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

endmodule