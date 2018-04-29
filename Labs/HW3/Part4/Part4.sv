module Part4(input logic CLOCK_50,input logic [1:0]SW, output logic [0:6]HEX0);
	logic [3:0]Q;
	cntFourBit FBC(CLOCK_50,4'd9,Q);
	hexDisplay HD(Q,HEX0);
endmodule