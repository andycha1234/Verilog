//counter for morse code. Shifts left to continue through morse code
module two_bit_counter (data, size, Clock, reset, E, en_clk, Q, rollover);
input Clock, reset, E, en_clk;
input [3:0] data;
input [2:0] size;

output Q;
output rollover;

reg Q;
reg [2:0] count, size_count;
reg [3:0] shift;
reg rollover;

//counter 0.5s
always @(posedge Clock) begin
	if (reset == 0) begin
		Q <= 0;
		count <= 0;
		size_count <= 0;
		shift <= data;
		rollover <= 0;
	end
	//KEY[1] pressed, logic module enable module
	else if(E == 1) begin
		if(en_clk == 1) begin
			if(size_count < size) begin
				if(shift[3] == 0) begin
					if(count == 1) begin
						Q <= 0;
						shift <= shift << 1;
						count <= 0;
						size_count <= size_count + 1;
					end
					else begin
						Q <= 1;
						count <= count + 1;
					end
				end
				
				else if(shift[3] == 1) begin
					if(count == 3) begin
						Q <= 0;
						shift <= shift << 1;
						count <= 0;
						size_count <= size_count + 1;
					end
					else begin
						Q <= 1;
						count <= count + 1;
					end
				end
			end
			else
				rollover <= 1;
		end
	end
end

endmodule