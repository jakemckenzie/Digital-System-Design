//     Jake McKenzie     |     TCES 330 Friday Section
// In this module I create a finite state machine which borrows ideas from
// part 1. Essentially we have a directed cyclic path starting at Space0 which then
// never returns to Space0 unless Reset goes high. This solution is overengineered
// of the reset states could be replaced to reduce code redundancy.1
module hello(input logic Clock,Reset,output logic [3:0]NextState);
    logic [3:0]CurrentState;
	 localparam Space0   = 4'h0,
               H        = 4'h1,
               E        = 4'h2,
               L1       = 4'h3,
               L2       = 4'h4,
               O        = 4'h5,
               Space1   = 4'h6,
               Space2   = 4'h7,
               Space3   = 4'h8;
    always_comb begin
        case(CurrentState)
            Space0: NextState = Reset ? Space0 : H;
            H:      NextState = Reset ? Space0 : E;
            E:      NextState = Reset ? Space0 : L1;
            L1:     NextState = Reset ? Space0 : L2;
            L2:     NextState = Reset ? Space0 : O;
            O:      NextState = Reset ? Space0 : Space1;
            Space1: NextState = Reset ? Space0 : Space2;
            Space2: NextState = Reset ? Space0 : Space3;
            Space3: NextState = Reset ? Space0 : H;
            default: NextState = Space0;
        endcase
    end
    always_ff @(posedge Clock, posedge Reset) begin
        CurrentState <= (Reset == 1) ? Space0: NextState;
    end
endmodule
`timescale 1ns/1ns
module hello_testbench();
    logic Clock,Reset;
    logic [3:0]NextState;

    hello DUT(Clock,Reset,NextState);

    always begin
		Clock = 0;
		#5;
		Clock = 1;
		#5;
    end
    initial begin
        Reset = 0;
        #10;
        #100;
        $stop;
    end

endmodule