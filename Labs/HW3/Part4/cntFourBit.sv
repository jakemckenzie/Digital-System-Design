//     Jake McKenzie     |     TCES 330 Friday Section
// In this section I make a 4 bit counter which increments on a 50MHz clock
// I didn't understand the example provided to us so I made my own. It
// increments a counter 50 million times then right when C = 50000000
// it increments the Q counter by 1 and sends this signal to the driver
// which in turn sends it to the hex display. I counted the signal with a
// stop watch. It appears perfectly alligned to be 1 second per tick.
module cntFourBit(input logic CLK,input logic [3:0]D,output logic [3:0]Q);
logic [25:0]c;
always_ff @(posedge CLK)
begin
	if (c < 50000000)
		c <= c + 26'b1;
	else
		begin
			c <= 26'b0;
			Q <= ((Q < D) ? Q + 4'b1 : 4'b0);
		end
end

endmodule

module cntFourBit_testbench();
	logic [3:0]Q,D;
	logic [25:0]c;
	logic CLK;
	integer i;
	cntFourBit DUT(CLK,D,Q);
	// initial
	// begin
	// 	$display("Toggle	   Q	mod((i >> 1) , 65536)	i");
	// end
	//
	//The console print was commented out for the graders convenience.
	initial
	begin
		//CLR = 0;
		c = 26'd0;
		D = 4'd9;
		i = 0;
		//T = 1;
		CLK = 1;
		//#1 CLR = 1;
		//assert(((i >> 1) % 65536)  == Q);
		$monitor("%d	%d",Q,i);
		repeat (10)//500000000
		begin
			#1 CLK = !CLK;
			i++;
		end
	end
endmodule