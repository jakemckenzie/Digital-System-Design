module Mux_4w_2_to_1(S,X,Y,m);
   input S, X, y;
   output m;

   assign m = (~S & X) | (S & Y);

module Mux_4w_2_to_1_testbench();

   reg S, X ,Y;
   wire m;

   Light DUT( .S(S), .Y(Y), .X(X));

   initial begin
      S = 0; X = 0; Y =0; #10;
      S = 0; X = 0; Y =1; #10;
      S = 0; X = 1; Y =0; #10;
      S = 0; X = 1; Y =1; #10;
      S = 1; X = 0; Y =0; #10;
      S = 1; X = 0; Y =1; #10;
      S = 1; X = 1; Y =0; #10;
      S = 1; X = 1; Y =1; #10;
      end
endmodule
   
