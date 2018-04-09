module Mux_3w_5_to_1(input S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]m);
	Mux_5_to_1 Mux_5_to_1_part5_1(S0,S1,S2,u[0],v[0],w[0],x[0],y[0],m[0]);
	Mux_5_to_1 Mux_5_to_1_part5_2(S0,S1,S2,u[1],v[1],w[1],x[1],y[1],m[1]);
	Mux_5_to_1 Mux_5_to_1_part5_3(S0,S1,S2,u[2],v[2],w[2],x[2],y[2],m[2]);
endmodule // Mux_3w_5_to_1

module Mux_3w_5_to_1_testbench();
   reg [2:0]u,v,w,x,y;
   reg S0,S1,S2;
   wire [2:0] m;

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