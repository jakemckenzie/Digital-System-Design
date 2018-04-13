module Mux_5_to_1(input S0,S1,S2,u,v,w,x,y,output m);
    logic W0,W1,W2;
	 Mux_2_to_1 t1(v,u,S0,W0);
    Mux_2_to_1 t2(x,w,S0,W1);
    Mux_2_to_1 t3(W1,W0,S1,W2);
    Mux_2_to_1 t4(y,W2,S2,m);
    //assign w0 = S0 ? v : u;
    //assign w1 = S0 ? x : w;
    //assign w2 = S1 ? w1 : w0;
    //assign m = S2 ? y : w2;
endmodule // Mux_5_to_1

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
