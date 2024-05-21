`timescale 1ns / 1ns

module testbench ();
	reg Clk_tb;
	reg D_tb;
	wire Q_tb;
	
	initial
		begin: CLOCK_GENERATOR
			Clk_tb = 1;
			forever
				begin
					#5 Clk_tb = ~Clk_tb;
				end
		end
	
	initial
		begin
			D_tb <= 0;
			#20 D_tb <= 1; 
			#20 D_tb <= 1;
			#20 D_tb <= 0;
			#20 D_tb <= 1;
			#20 D_tb <= 0;
			#20 D_tb <= 1;
			
		end
		
	part2 p2 (Clk_tb, D_tb, Q_tb);
endmodule