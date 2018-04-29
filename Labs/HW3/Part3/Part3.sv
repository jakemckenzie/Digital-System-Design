//     Jake McKenzie     |     TCES 330 Friday Section
//This module drives a 16 bit counter and 4 hex display modules. I have only checked it for values up to
// 256 or 0x100 because I am not a crazy man who has time to check all 65536 cases.
//
//1) How many logic elements (LEs) are used to implement your circuit? 
// There are 46 total logic elements.
//2) What is the maximum frequency, Fmax (Slow 1200mV 85C Model), at which your circuit can be operated? 
// 386.7 MHz
//3) Comment on the differences between this and Part 1 and Part 2
// This has more logical elements than part 2 but less than part 1. It also has a FMax which is between both part 1
// and part 2. It was really difficult to understand what was going on in the netlist viewer for this circuit.
// It appears to have created 8 two bit counters in sequence. I believe I save one gate by having the select bit
// due to taking care of the initial condition in the way that I did but I do not know what the black box that is
// quartus is operating under the hood.
module Part3(input logic [0:0]KEY,input logic [1:0]SW,output logic [0:6]HEX0,HEX1,HEX2,HEX3,output logic [1:0]LEDR);
	wire [15:0]Q;
	cntSixteen counter(KEY[0],SW[1],!SW[0],Q);
	hexDisplay hexD0(Q[3:0],HEX0);
	hexDisplay hexD1(Q[7:4],HEX1);
	hexDisplay hexD2(Q[11:8],HEX2);
	hexDisplay hexD3(Q[15:12],HEX3);
endmodule