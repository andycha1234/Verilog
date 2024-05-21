module smaller_counter (Clock, E, Q);
input Clock;
input E;

output reg [2:0] Q;

always@(posedge Clock) begin
	if(E == 1) begin
		if(Q == 5) 
			Q = 0;
		else
			Q = Q + 1;
	end
end

endmodule