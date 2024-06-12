module smaller_counter (Clock, E, Q);
input Clock;
input E;

output reg [1:0] Q;

always@(posedge Clock) begin
	if(E == 1) begin
		if(Q == 4) 
			Q = 0;
		else
			Q = Q + 1;
	end
end

endmodule