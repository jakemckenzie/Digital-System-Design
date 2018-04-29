module TFF1(input logic T,CLK,CLR,output logic Q);
	always@(posedge CLK, negedge CLR)
	begin
		if(~CLR)
			Q <= 1'b0;
		else
			Q <= Q ^ T;
	end
endmodule

module TFF1_testbench();
	logic T,CLK,CLR,Q;
	TFF1 DUT(T,CLK,CLR,Q);
	 always begin
		CLK = 0;
		#10;
		CLK = 1'b1;
		#10;

		end
	initial begin
		T = 0;
		CLR = 0; // clear
		#83;
		T = 1'b1;
		#80;
		CLR = 1'b1;
		# 210;
		T = 0;
		#80;
		CLR = 0;
		#100;
		$stop;
	end
	
endmodule
