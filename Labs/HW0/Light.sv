module Light(F, X1, X2);

   input X1, X2;
   output F;
   assign F = (X1 & ~X2) | (~X1 & X2);

endmodule


module Light_testbench();

   reg X1, X2;
   wire F;

   Light DUT( .X1(X1), .X2(X2), .F(F)); //not so strange

   initial begin
      X1 = 0; X2 = 0; #10;
      X1 = 0; X2 = 1; #10;
      X1 = 1; X2 = 0; #10;
      X1 = 1; X2 = 1; #10;
   end

endmodule