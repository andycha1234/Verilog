module logic (Clock, display, E_size, E_shift, dot, reset, rollover, enable, Q);
input Clock;
input display, E_size, E_shift, dot, reset;
input rollover;

output enable;
output Q;

reg Q;
reg enable;

always@(posedge Clock) begin
	//KEY[0] - reset
	if(reset == 0) begin
		enable <= 0;
		Q <= 0;
	end
	//KEY[1] - display
	else if(display == 0) begin
		enable <= 1;
		Q <= 0;
	end
	else if(rollover == 1)
		Q <= 0;
	else if(E_size == 1 && E_shift == 1 && enable == 1) begin
		Q <= dot;
	end
end

endmodule 