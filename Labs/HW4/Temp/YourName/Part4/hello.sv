//     Jake McKenzie     |     TCES 330 Friday Section
// In this module I create a finite state machine which borrows ideas from
// part 1. Essentially we have a directed cyclic path starting at Space0 which then
// never returns to Space0 unless Reset goes high. This solution is overengineered
// of the reset states could be replaced to reduce code redundancy.1
module hello(input logic Clock,Reset,input logic [3:0]Control,output logic [3:0]NextState);
	 localparam Space   = 4'h0,
                H       = 4'h1,
                E       = 4'h2,
                L       = 4'h3,
                O       = 4'h4;
    always_comb begin
        case(Control)
            4'h0: NextState = Reset ? Space : H;
            4'h1: NextState = Reset ? Space : E;
            4'h2: NextState = Reset ? Space : L;
            4'h3: NextState = Reset ? Space : L;
            4'h4: NextState = Reset ? Space : O;
            4'h5: NextState = Space;
            4'h6: NextState = Space;
            4'h7: NextState = Space;
            default: NextState = Space;
        endcase
    end
endmodule
`timescale 1ns/1ns
module hello_testbench();
    logic Clock,Reset;
    logic [3:0]NextState,Control;
	 integer i;
    hello DUT(Clock,Reset,Control,NextState);

    always begin
		Clock = 0;
		#5;
		Clock = 1;
		#5;
    end
	 initial 
    begin
        $display("Control    NextState");    
    end
    initial begin
        Reset = 0;
        for (i = 0; i < 8; i++) begin
				$monitor("%h        	%h",Control, NextState);
				Control = i;#10;
		  end
        $stop;
    end

endmodule