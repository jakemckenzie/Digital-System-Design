//     Jake McKenzie     |     TCES 330 Friday Section
//In this module I drive the rest of my circuit. The switches are first assigned to LEDR
//Then a wire Q is instantiated. That wire becomes the outputs to be displayed.
//
//1) How many logic elements(LEs) are used to implement your circuit? 
// There are 45 logic elements in this circuit. 
//
//2)What is the maximum frequency, Fmax(Slow 1200mV 85C Model),at which your circuit can be operated?
// Fmax = 356.55Mhz
//
//3)Comment on the differences between this and Part 1.
// There are 5 fewer logic elements in part 2 as opposed to part 1. Fmax decreased by 2Mhz.
// In the netlist viewer we can see that there are now two muxes and one adder and 15 registers as opposed to 15 and elements
// with 16 T flip flops. Aside from it being less elements it is much easier to see what is going on with the circuit as
// the complexity was reduced a lot.
module Part2(input logic [0:0]KEY,input logic [1:0]SW,output logic [0:6]HEX0,HEX1,HEX2,HEX3,output logic [1:0]LEDR);
	assign LEDR = SW;
	wire [15:0]Q;
	counter16bitpart2 STB_TFF(KEY[0:0],SW[1],SW[0],Q[15:0]);
	hexDisplay hexD0(Q[3:0],HEX0);
	hexDisplay hexD1(Q[7:4],HEX1);
	hexDisplay hexD2(Q[11:8],HEX2);
	hexDisplay hexD3(Q[15:12],HEX3);
endmodule