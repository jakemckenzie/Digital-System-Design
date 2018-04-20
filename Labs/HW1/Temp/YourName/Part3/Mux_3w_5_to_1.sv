//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module I instantiated three modules that I made previously. Originally I did this without another module but I
//  went back and changed it to this code structure to match the assignment specifications.

module Mux_3w_5_to_1(input S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]m);
   //assign w0 = S0 ? v : u;
   //assign w1 = S0 ? x : w;
   //assign w2 = S1 ? w1 : w0;
   //assign m = S2 ? y : w2;
	
	Mux_5_to_1 g1(S0,S1,S2,u[0],v[0],w[0],x[0],y[0],m[0]);
	Mux_5_to_1 g2(S0,S1,S2,u[1],v[1],w[1],x[1],y[1],m[1]);
	Mux_5_to_1 g3(S0,S1,S2,u[2],v[2],w[2],x[2],y[2],m[2]);
endmodule // Mux_3w_5_to_1

//  For this test bench I thought deeply about what I needed to do to set each signal through and ~know~ that
//  I was sending a unique signal through without testing every possible input. I settled on this synthesis.
//
//  This appears to output correct values.

module Mux_3w_5_to_1_testbench();
   reg [2:0]u,v,w,x,y;
   reg S0,S1,S2;
   wire [2:0]m;

   Mux_3w_5_to_1 DUT(S0,S1,S2,u,v,w,x,y,m);
   initial begin
		u = 1; v = 2;w = 3;x = 4;y = 5;
		S0 = 0;S1 = 0;S2 = 1;#10;
		S0 = 1;S1 = 1;S2 = 0;#10;
		S0 = 0;S1 = 1;S2 = 0;#10;
		S0 = 1;S1 = 0;S2 = 0;#10;
		S0 = 0;S1 = 0;S2 = 0;#10;
   end

endmodule // Mux_3w_5_to_1_testbench
