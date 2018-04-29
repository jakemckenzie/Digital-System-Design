//     Jake McKenzie     |     TCES 330 Friday Section
//In this module I drive the rest of my circuit. The switches are first assigned to LEDR
//Then a wire Q is instantiated. That wire becomes the outputs to be displayed.
//
//1) How many logic elements(LEs) are used to implement your circuit? 
//50 logical elements were used in the creation of this circuit.
//
//2)What is the maximum frequency, Fmax(Slow 1200mV 85C Model),at which your circuit can be operated?
// Fmax = 358.55Mhz
//
//3)Use the QuartusII RTL Viewer to see how QuartusII software synthesized your circuit. What are the
//differences in comparison with Figure 1?
//The main difference is that the Quartus appears have bunched the 'and' gates together in groups of 4
//when it could. This must have been a more convenient way to group the elements together but aside from
//that it appears to be the same diagram.
module Part1(input logic [0:0]KEY,input logic [1:0]SW,output logic [0:6]HEX0,HEX1,HEX2,HEX3,output logic [1:0]LEDR);
	assign LEDR = SW;
	wire [15:0]Q;
	counter16bit STB_TFF(KEY[0:0],SW[1],SW[0],Q[15:0]);
	hexDisplay hexD0(Q[3:0],HEX0);
	hexDisplay hexD1(Q[7:4],HEX1);
	hexDisplay hexD2(Q[11:8],HEX2);
	hexDisplay hexD3(Q[15:12],HEX3);
endmodule