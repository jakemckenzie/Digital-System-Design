//  Jake McKenzie | Digital Systems Design | Homework 1
//
//	A ternary operation is an triary operation which takes three arguments just like a 2 to 1 multiplexer and outputs
//	one of the two arguments depending on the truth value of the third argument. A multiplexer is a device that selects 
//	one of several input signals and forwards the selected input to the output. 
//
//	In this example we apply vectors to the ternary operator to obtain sythesizable code for a four wide 2 to 1 multiplexer.

module Mux_4w_2_to_1(input [3:0]X,Y,input S, output [3:0]m);

   assign m = S ? X : Y;

endmodule

//	This was my first testbench that I ever wrote. Due to the total number of 
//	possible inputs 2^9 we were asked to pick some values of both. I generated
//	these inputs randomly in C with a for loop.
//
//	For these random values the 4 output appears to be correct.

module Mux_4w_2_to_1_testbench();

	reg [3:0]X;
	reg [3:0]Y;
	reg S;
	wire [3:0]m;
	
	Mux_4w_2_to_1 DUT(X,Y,S,m);
   initial begin
		X[0] = 0;X[1] = 0;X[2] = 1;X[3] = 0;Y[0] = 1;Y[1] = 0;Y[2] = 1;Y[3] =1;S =1;#10;
		X[0] = 0;X[1] = 0;X[2] = 1;X[3] = 1;Y[0] = 0;Y[1] = 0;Y[2] = 0;Y[3] =1;S =0;#10;
		X[0] = 0;X[1] = 1;X[2] = 0;X[3] = 0;Y[0] = 0;Y[1] = 1;Y[2] = 0;Y[3] =0;S =1;#10;
		X[0] = 0;X[1] = 1;X[2] = 0;X[3] = 0;Y[0] = 0;Y[1] = 1;Y[2] = 1;Y[3] =0;S =0;#10;
		X[0] = 0;X[1] = 1;X[2] = 1;X[3] = 0;Y[0] = 0;Y[1] = 0;Y[2] = 0;Y[3] =1;S =0;#10;
		X[0] = 0;X[1] = 1;X[2] = 1;X[3] = 0;Y[0] = 0;Y[1] = 1;Y[2] = 1;Y[3] =1;S =1;#10;
		X[0] = 0;X[1] = 1;X[2] = 1;X[3] = 0;Y[0] = 1;Y[1] = 0;Y[2] = 1;Y[3] =1;S =1;#10;
   end

	
endmodule