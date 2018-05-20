//  Jake McKenzie | Digital Systems Design | Homework 1
//
//	For this module we are instantiating one instance of our three wide 5 to 1 mux and outputting them to the LEDs.
module Part3(input [17:0]SW,output [2:0]LEDG);
   Mux_3w_5_to_1 f(SW[15],SW[16],SW[17],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],LEDG[2:0]);
endmodule
