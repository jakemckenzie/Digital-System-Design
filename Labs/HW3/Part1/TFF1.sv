////     Jake McKenzie     |     TCES 330 Friday Section
//// This module implements a simple Toggle Flip Flop (TFF).
//// Note: Quartus won't let us call the TFF because it has a built-in TFF
//// so we call it other names such as TFFx or TestTFF.
////
////It was included on canvas by Robert Gootmann.
module TFF1(input logic T, Clk, ClrN, output logic Q = 0);
  	always @( posedge Clk ) begin
		if ( ~ClrN ) begin
			Q <= 0;
		end // not enabled
		else begin  // enabled
			if ( T ) 
			  Q <= ~Q;
			else 
			  Q <= Q;
		end  // enabled
	end  // alway
endmodule 
`timescale 1ns/1ns
module TFF1_testbench;
	logic T;        // toggle signal
	logic Clk;      // system clock
	logic ClrN;     // synchronous (not) clear signal
	logic Q;  // the output
	logic QN;       // inverted output
  TFF1 DUT( T, Clk, ClrN, Q, QN );
	always begin
	  Clk = 0;
		#10;
		Clk = 1'b1;
		#10;
	end
	initial begin
	  T = 0;
		ClrN = 0; // clear
		#83;
		T = 1'b1;
		#80;
		ClrN = 1'b1;
		# 210;
		T = 0;
		#80;
		ClrN = 0;
		#100;
		$stop;
	end
endmodule