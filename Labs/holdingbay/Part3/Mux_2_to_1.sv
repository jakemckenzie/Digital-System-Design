module Mux_2_to_1(input x,y,s, output o);
    assign o = s ? x : y;
endmodule

module Mux_2_to_1_testbench();
   reg s,x,y;
   wire o;

   Mux_2_to_1 DUT(s,x,y,o);
   initial begin
        s = 0;x = 0;y = 0; #10;
		  s = 1;x = 0;y = 0; #10;
		  s = 1;x = 0;y = 1; #10;
		  s = 0;x = 0;y = 1; #10;
		  s = 1;x = 1;y = 0; #10;
		  s = 0;x = 1;y = 0; #10;
		  s = 1;x = 1;y = 1; #10;
		  s = 1;x = 1;y = 1; #10;
   end

endmodule // Mux_5_to_1_testbench
