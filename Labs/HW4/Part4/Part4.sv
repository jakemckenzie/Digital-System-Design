//     Jake McKenzie     |     TCES 330 Friday Section
// This is the driver for ticker tape. Essentially it instantiates a new clock
// that slows down the 50 MHz clock from having a period of 20 ns to 1s.
// That new clock signal is what is sent to the shift register and the "hello" 
// finite state machine. That FSM produces a single signal. The shift register
// produces 8 signals which are sent to all 8 displays.
module Part4(input logic [0:0]SW,input logic CLOCK_50, output logic [0:6]HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
	logic [3:0]in1,in2,out1,out2,out3,out4,out5,out6,out7,out8;
    logic Clock;
    MHzCLock MHC(CLOCK_50,Clock);
    shiftRegister SR(in1,Clock,SW,out1,out2,out3,out4,out5,out6,out7,out8);
	hello H(Clock,SW,in2 % 8,in1);
	counter C(Clock,SW,2'h1,in2);
	hexDisplay HD0(out1,HEX0);
	hexDisplay HD1(out2,HEX1);
	hexDisplay HD2(out3,HEX2);
	hexDisplay HD3(out4,HEX3);
	hexDisplay HD4(out5,HEX4);
	hexDisplay HD5(out6,HEX5);
	hexDisplay HD6(out7,HEX6);
	hexDisplay HD7(out8,HEX7);
endmodule