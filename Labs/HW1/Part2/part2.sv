//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module we are instantiating one instance of our four wide 2 to 1 mux and outputting them to the LEDs.
module Part2(input [17:0]SW,output [3:0]LEDG,output [17:0]LEDR);
    assign LEDR = SW;
    Mux_4w_2_to_1 MUX(SW[3:0],SW[7:4],SW[17],LEDG[3:0]);
endmodule