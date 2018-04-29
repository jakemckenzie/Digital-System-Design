// Outputs a 1 KHz signal based on a 50 MHz clock
// 

module KHzCLock( Clock, Out );
  input Clock;       // system (50 MHz) clock
  output logic Out;  // 1 KHz signal
	
  logic [15:0] Q = 0;
  
  parameter MaxCount = 50_000;
  
  always_ff @( posedge Clock ) begin
  	if ( Q == MaxCount-1 ) begin // time to do something
  		Q <= 0;       // reset the counter
  		Out <= 1'b1;  // output the signal
		end
  	else begin  // just count
  		Q <= Q + 1'b1;  // inc the counter 
  		Out <= 1'b0;    // output a zero
		end
  end
  
  
endmodule

//******************************************************//
//                 Testbench	                          //
//                                                      //
// Note: You have NO way of knowing how accurate this   //
// counter/timer is without ModelSim testing            //
//                                                      //
//******************************************************//
`timescale 1 ns/1 ns
module KHzCLock_testbench;
  logic Clock;  // system clock
	logic Sig;    // 1 KHz signal
	
	KHzCLock DUT( Clock, Sig );
	
	always begin
	  Clock = 0;
		#10;
		Clock = 1'b1;
		#10;
	end
	
	initial begin
	  #2_000_100 $stop;
	end

endmodule
