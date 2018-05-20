// TCES 330, Spring 2018
// Updated for SystemVerilg
// R. Gutmann 4/15/2017
//
// This module implements a simple Toggle Flip Flop (TFF).
// Note: Quartus won't let us call the TFF because it has a built-in TFF
// so we call it other names such as TFFx or TestTFF.



module TFF( T, Clk, ClrN, Q, QN );
  
	input T;    // toggle signal
	
	input Clk;  // system clock
	
	input ClrN; // synchronous (not) clear signal
	
  	output logic Q = 0;   // the output
  

	output QN;  // inverted output
  
  
	assign QN = ~Q; // the inverted output
  
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
 
  

/*
// if we use the built-in TFF, we will have trouble simulating in ModelSim
  
// change output Q to a wire
  
	logic PrN = 1'b1;
  
	tff tff0 ( .t(T), .clk(Clk), .clrn(ClrN), .prn(PrN), .q(Q) );
  
//tff tff0 ( .t(T), .clk(Clk), .clrn(ClrN), .q(Q) ); 
  
*/


endmodule 

`timescale 1ns/1ns
module TFF_testbench;
  
	logic T;        // toggle signal
	logic Clk;      // system clock
	logic ClrN;     // synchronous (not) clear signal
  logic Q;  // the output
  logic QN;       // inverted output
  
  TFF DUT( T, Clk, ClrN, Q, QN );
	
	// 50 MHz clock
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

	
