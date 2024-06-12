module letter_selection_logic (select, data);
input [2:0] select;

output [3:0] data;

reg [3:0] data;

always @(select) begin
	case(select)
		//A - 01
		3'b000: data <= 4'b0001;
		//B - 1000
		3'b001: data <= 4'b1000;
		//C - 1010
		3'b010: data <= 4'b1010;
		//D - 100
		3'b011: data <= 4'b0100;
		//E - 0
		3'b100: data <= 4'b0000;
		//F - 0010
		3'b101: data <= 4'b0010;
		//G - 110
		3'b110: data <= 4'b0110;
		//H - 0000
		3'b111: data <= 4'b0000;
	endcase
end

endmodule