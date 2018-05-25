// A generic clock divider
module Pulser #(parameter DIVISOR) (
	input Clk,
	output reg pulse
);
	logic[$clog2(DIVISOR)-1:0] count;
	
	// make sure we start with 0
	initial count = 0;
	
	// this should produce one pulse every DIVISOR cycles
	always @(posedge Clk) begin
		if(count==DIVISOR-1) begin
			count <= 1'b0;
			pulse <= 1'b1;
		end else begin
			count <= count+1'b1;
			pulse <= 1'b0;
		end
	end
endmodule


module Pulser_tb;
	logic in, out;
	parameter COUNT = 5000;
	
	
	Pulser #(COUNT) DUT(in, out);
	
	initial for(int i=1; i<5*COUNT+1; i++) begin
		in =0; #10; in =1; #10;
		
		if(i%COUNT == 0) assert(out==1);
		else assert(out == 0);
	end
	
endmodule

