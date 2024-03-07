module light_tb;

	reg x1,x2;
	
	wire f;
	
	light u1(.x1(x1), .x2(x2), .f(f));
	
	initial begin
	x1 = 0; x2 = 0;
	#10
	x1 = 0; x2 = 1;
	#10
	x1 = 1; x2 = 0;
	#10
	x1 = 1; x2 = 1;
	#10
	$finish;
	end
	
	initial
	$monitor("[$monitor] time = %0t | x1 = %b | x2 = %b", $time, x1, x2, f);

endmodule