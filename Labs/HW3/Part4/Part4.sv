//     Jake McKenzie     |     TCES 330 Friday Section
// This driver sends a clock to a four bit counter then the output of that
// counter to be displayed.
module Part4(input logic CLOCK_50,input logic SW[1:0], output logic [0:6]HEX0);
	logic [3:0]Q;
	logic v;
	MHzCLock MHC(CLOCK_50,v);
	cntFourBit FBC(v,SW[1],SW[0],Q);
	hexDisplay HD(Q,HEX0);
endmodule