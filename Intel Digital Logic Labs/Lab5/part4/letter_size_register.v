module letter_size_register (select, load, reset, enable, size);
input load, reset;
input [2:0] select;

output enable;
output [2:0] size;

reg enable;
reg [2:0] size;

always@(select, reset) begin
	if(reset == 0) begin
		enable <= 0;
		size <= 0;
	end
	//else if(load == 1) begin
		enable <= 1;
		//get size of letter symbols
		case(select)
			//A - 01
			3'b000: size <= 4'd2;
			//B - 1000
			3'b001: size <= 4'd4;
			//C - 1010
			3'b010: size <= 4'd4;
			//D - 100
			3'b011: size <= 4'd3;
			//E - 0
			3'b100: size <= 4'd1;
			//F - 0010
			3'b101: size <= 4'd4;
			//G - 110
			3'b110: size <= 4'd3;
			//H - 0000
			3'b111: size <= 4'd4;
		endcase
	//end
end

endmodule