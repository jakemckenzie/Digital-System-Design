module part2(SW,LEDG,LEDR);
   input [17:0]SW;
   output [3:0]LEDG;
   output [17:0]LEDR;
   assign LEDR = SW;
//x y s m
   Mux_4w_2_to_1 MUX(SW[3:0],SW[7:4],SW[17],LEDG[3:0]);
endmodule
