module Mux_4w_2_to_1(input [3:0]X,Y,input S, output [3:0]m);

   assign m = S ? X : Y;

endmodule   
