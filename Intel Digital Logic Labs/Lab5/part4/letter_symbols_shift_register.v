module letter_symbols_shift_register (data, load, enable, reset, size, symbol);
input [3:0] data;
input [2:0] size;
input load, reset;

output enable;
output [3:0] symbol;

reg [3:0] shift_reg;
reg enable;
reg [3:0] symbol;

always@(data, reset) begin
	if(reset == 0) begin
		enable <= 0;
		symbol <= 0;
	end
	//else if(load == 1) begin
		enable <= 1;
		shift_reg <= data;
		//gets amount of time we need to shift so morse code starts from highest bit
		//if size = 4 then we dont need to shift
		//shift left to where actual morse code begins.
		//removes unnecessary zeros from being added and put to the right hand side
		symbol <= shift_reg << (4-size);
	//end
end

endmodule