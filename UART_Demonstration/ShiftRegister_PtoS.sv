/**	A Generic parallel to serial shift register
 *	Ammon Dodson
*/

module ShiftRegister_PtoS #(parameter WIDTH, COUNT) (
	input clk, set,
	input             [WIDTH-1:0] shiftIn,
	input  [COUNT-1:0][WIDTH-1:0] in,
	output            [WIDTH-1:0] out
);
	genvar i;
	logic[COUNT:0][WIDTH-1:0] register;
	
	assign register[COUNT] = shiftIn; // the value that will be shifted in
	
	assign test = register;
	
	generate
		for(i=0; i<COUNT; i++) begin: regs
			always_ff @(posedge clk) begin
				if(set) register[i] <= in[i];
				else    register[i] <= register[i+1];
			end
		end
	endgenerate
	
	assign out = register[0];
	
endmodule


module ShiftRegister_PtoS_tb;
	parameter WIDTH=1, COUNT=8;
	
	logic clock, set;
	logic [COUNT-1:0][WIDTH-1:0] in;
	logic            [WIDTH-1:0] out;
	logic            [WIDTH-1:0] shiftIn =1;
	
	ShiftRegister_PtoS #(WIDTH, COUNT) DUT(clock, set, shiftIn, in, out);
	
	initial begin
		in = 8'ha5;
		
		set =1;
		clock =1; #10; clock =0; #10;
		clock =1; #10; clock =0; #10;
		set =0;
		
		for(int i=1; i<8; i++) begin
			clock =1; #10; clock =0; #10;
			//assert(out[0] == i);
		end
	end
	
endmodule



