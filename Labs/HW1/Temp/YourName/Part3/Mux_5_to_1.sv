//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module I used 4 ternary operations to mimick the same operations that are happening on the circuit
//  to build a synthesizable circuit. I was going to instantiate 4 modules that would do the same operation for me
//  but I ran into many errors and became frustrated as I did not make a testbench for the lowest part of the file
//  file structure and it would not run in modelsim.

module Mux_5_to_1(input S0,S1,S2,u,v,w,x,y,output m);
    logic w0,w1,w2;
	 //Mux_2_to_1 t1(v,u,s0,w0);
	 //Mux_2_to_1 t2(x,w,s0,w1);
    //Mux_2_to_1 t3(w1,w0,s1,w2);
    //Mux_2_to_1 t4(y,w2,s2,m);
    assign w0 = S0 ? v : u;
    assign w1 = S0 ? x : w;
    assign w2 = S1 ? w1 : w0;
    assign m = S2 ? y : w2;
endmodule // Mux_5_to_1
//  For this testbench I am sending unique signals through the muxes and only changing the value which should change to show
//  that it's operating as expect. It is doing what I expect it to do.
module Mux_5_to_1_testbench();
   reg S0,S1,S2,u,v,w,x,y;
   wire m;

   Mux_5_to_1 DUT(S0,S1,S2,u,v,w,x,y,m);
   initial begin
        u = 0;v = 0; w = 0;x = 0;y =0;
        S0 = 0;S1 = 0;S2 = 0;u = 1;#10;
        S0 = 0;S1 = 0;S2 = 0;u = 0;#10;
        S0 = 1;S1 = 0;S2 = 0;v = 1;#10;
        S0 = 1;S1 = 0;S2 = 0;v = 0;#10;
        S0 = 0;S1 = 1;S2 = 0;w = 1;#10;
        S0 = 0;S1 = 1;S2 = 0;w = 0;#10;
        S0 = 1;S1 = 1;S2 = 0;x = 1;#10;
        S0 = 1;S1 = 1;S2 = 0;x = 0;#10;
        S0 = 0;S1 = 0;S2 = 1;y = 1;#10;
        S0 = 0;S1 = 0;S2 = 1;y = 0;#10;
   end

endmodule // Mux_5_to_1_testbench
