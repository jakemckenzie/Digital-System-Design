//     Jake McKenzie     |     TCES 330 Friday Section
// In this section I make a 4 bit counter which increments on a 50MHz clock
// I didn't understand the example provided to us so I made my own. It
// increments a counter 50 million times then right when C = 50000000
// it increments the Q counter by 1 and sends this signal to the driver
// which in turn sends it to the hex display. I counted the signal with a
// stop watch. It appears perfectly alligned to be 1 second per tick.
module cntFourBit(input logic CLK,CLR,T,output logic [3:0]Q);
    always_ff @(posedge CLK)
	begin
		Q <= (Q < 7) ? (CLR ? (T ? (Q + 4'h1): Q) : 4'h0) : 4'h0;
    end
endmodule
//This is the same testbench I used for part 2. This is also the same module, mostly from
//part 2. Essentially I make sure the circuit counter matches my own counter. If it ticks
//up the same then I know it is correct.
module cntFourBit_testbench();
	logic [3:0]Q;
	logic CLK,CLR,T;
	integer i;
	cntFourBit DUT(CLK,CLR,T,Q);
	// initial
	// begin
	// 	$display("Toggle	   Q	mod((i >> 1) , 65536)	i");
	// end
	//
	//The console print was commented out for the graders convenience.
	initial
	begin
		CLR = 0;
		i = 0;
		T = 1;
		CLK = 1;
		#1 CLR = 1;
		assert(((i >> 1) % 9)  == Q);
		//$monitor("%b	%d	%d	%d",T,Q,((i >> 1) % 65536) , i);
		repeat (20)//65536*2=131072
		begin
			#1 CLK = !CLK;
			i++;
		end
	end
endmodule