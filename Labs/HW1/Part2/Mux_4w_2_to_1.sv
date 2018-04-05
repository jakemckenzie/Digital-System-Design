module Mux_4w_2_to_1(input [3:0]X,Y,input S, output [3:0]m);

   assign m = S ? X : Y;

endmodule

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