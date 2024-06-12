// 1st counter for min
module smaller_counter_seg5 (Clock, Stop, counter, counter2, counter3, counter4, E, Q, rollover, set, set_num, send_num, hold);
parameter n = 4;
parameter k = 20;

input E, Clock, Stop, counter, counter2, counter3, counter4, set, hold;
input [5:0] set_num;

output [n-1:0] Q;
output rollover;
output [2:0] send_num;

reg [n-1:0] Q;
reg rollover;
reg [2:0] send_num;

always @(posedge Clock) begin
	//if KEY0 is pressed, stop counter
	if (hold == 0) begin
		Q <= Q;
		//rollover <= 0;
	end
	else if(set == 0) begin
		//range from 10-19, set HEX5 as first digit and HEX6 as 1
		if(set_num > 9 && set_num < 20) begin
			Q <= set_num - 10;
			send_num <= 1;
		end
		//range from 20-29, set HEX5 as first digit and HEX6 as 2
		else if(set_num > 19 && set_num < 30) begin
			Q <= set_num - 20;
			send_num <= 2;
		end
		//range from 30-39, set HEX5 as first digit and HEX6 as 3
		else if(set_num > 29 && set_num < 40) begin
			Q <= set_num - 30;
			send_num <= 3;
		end
		//range from 40-49, set HEX5 as first digit and HEX6 as 4
		else if(set_num > 39 && set_num < 50) begin
			Q <= set_num - 40;
			send_num <= 4;
		end
		//range from 50-59, set HEX5 as first digit and HEX6 as 5
		else if(set_num > 49 && set_num < 60) begin
			Q <= set_num - 50;
			send_num <= 5;
		end
		//range from 0-9, set HEX5 as first digit and HEX6 as 0
		else if(set_num >= 0 && set_num < 10) begin
			Q <= set_num;
			send_num <= 0;
		end
	end
	else if (E == 1) begin
		//If HEX3, HEX2, HEX1, HEX0 are 9, then increment counter
		if(counter == 1 && counter2 == 1 && counter3 == 1 && counter4 == 1) begin
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