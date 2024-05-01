`timescale 1ns / 1ns

module testbench ();
	reg Clk_tb;
	reg D_tb;
	wire Qa_tb;
	wire Qb_tb;
	wire Qc_tb;
	
	wire not_Qa_tb;
	wire not_Qb_tb;
	wire not_Qc_tb;
	
	initial
		begin: CLOCK_GENERATOR
			Clk_tb = 0;
			forever
				begin
					#30 Clk_tb = ~Clk_tb;
				end
		end
	
	initial
		begin
			D_tb <= 0;
			#20 D_tb <= 1;
			#20 D_tb <= 0;
			#5 D_tb <= 1;
			#10 D_tb <= 0;
			#10 D_tb <= 1;
			#10 D_tb <= 0;
			#5 D_tb <= 1;
			#5 D_tb <= 0;
			#10 D_tb <= 1;
			#5 D_tb <= 0;
			#5 D_tb <= 1;
			#20 D_tb <= 0;
		end
		
	part4 p4 (D_tb, Clk_tb, Qa_tb, not_Qa_tb, Qb_tb, not_Qb_tb, Qc_tb, not_Qc_tb);
endmodule