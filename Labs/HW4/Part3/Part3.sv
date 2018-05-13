//     Jake McKenzie     |     TCES 330 Friday Section
// This is the driver for ticker tape. Essentially it instantiates a KEY which
// which is sent to  the shift register and the "hello" finite state machine. 
// That FSM produces a single signal. The shift register produces 8 signals which
// are sent to all 8 displays.
module Part3(input logic [0:0]KEY,SW, output logic [0:6]HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
	logic [3:0]in1,out1,out2,out3,out4,out5,out6,out7,out8;
	shiftRegister SR(in1,KEY,SW,out1,out2,out3,out4,out5,out6,out7,out8);
	hello H(KEY,SW,in1);
	hexDisplay HD0(out2,HEX0);
	hexDisplay HD1(out3,HEX1);
	hexDisplay HD2(out4,HEX2);
	hexDisplay HD3(out5,HEX3);
	hexDisplay HD4(out6,HEX4);
	hexDisplay HD5(out7,HEX5);
	hexDisplay HD6(out8,HEX6);
	hexDisplay HD7(out1,HEX7);
endmodule