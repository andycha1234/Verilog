module T_Flipflop (T, clk, rst, Q);
input T, clk, rst;

output reg Q;
//output reg not_Q;

always@(posedge clk, negedge rst) begin
	if(rst == 0)
		Q = 1'b0;
		//not_Q = 0;
	else
		Q = Q ^ T;
		//not_Q = ~Q;
end

endmodule