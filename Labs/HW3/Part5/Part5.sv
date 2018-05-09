//     Jake McKenzie     |     TCES 330 Friday Section
// This is the driver for my part 5. It instantiates a clock signal
// then sends that signal to a counter, which are then
// sent to 8 hex displays. I took advantage of the fact that the counter
// rolls over.
module Part5(input logic CLOCK_50,input logic SW[1:0], output logic [0:6]HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
	logic [2:0]Q;
	logic v;
	MHzCLock MHC(CLOCK_50,v);
	cntFourBit FBC(v,SW[1],SW[0],Q);
	
	hexDisplay HD0((Q + 7) % 8,HEX0);
	hexDisplay HD1((Q + 6) % 8,HEX1);
	hexDisplay HD2((Q + 5)  % 8,HEX2);
	hexDisplay HD3((Q + 4)  % 8,HEX3);
	hexDisplay HD4((Q + 3)  % 8,HEX4);
	hexDisplay HD5((Q + 2)  % 8 ,HEX5);
	hexDisplay HD6((Q + 1) % 8,HEX6);
	hexDisplay HD7(Q % 8,HEX7);
endmodule