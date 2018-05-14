//     Jake McKenzie     |     TCES 330 Friday Section
// In this section I construct a state machine counter by way of multiplexers.
// Essentially if reset is high the count goes to zero else it completes 3 different states
// specified in the assigment instructions unless it is in the naught state where everything is set to zero.
// I probably have superfulous states here but I don't think it matters.
module counter(input logic Clock, Reset,input logic [1:0]Control, output logic [3:0]toDisplay);
    logic [3:0]Sum;
    localparam naught = 2'h0,
               addOne = 2'h1,
               addTwo = 2'h2,
               subOne = 2'h3;
    always_ff @(posedge Clock) begin
        case(Control)
            naught: Sum <= 4'h0;
            addOne: Sum <= Reset ? 4'h0 : Sum + 4'h1;
            addTwo: Sum <= Reset ? 4'h0 : Sum + 4'h2;
            subOne: Sum <= Reset ? 4'h0 : Sum - 4'h1;
            default: Sum <= 4'h0;
        endcase
    end
    
    assign toDisplay = Sum;
endmodule
//In this testbench I test each of the main states for 4 clock cycles.
// It appears to be counting by 1, 2 and decrementing by 1 correctly.
`timescale 1ns/1ns
module counter_testbench();
    logic Clock,Reset;
    logic [1:0]Control;
    logic [3:0]toDisplay;

	counter DUT(Clock, Reset, Control, toDisplay); 
	
	always begin
		Clock = 0;
		#5;
		Clock = 1;
		#5;
	end
	
	
    initial begin
        Clock = 0;
        Control = 2'h0;
        Reset = 0;
        #21;
        Control = 2'h1;
        #40;
        Control = 2'h2;
        #40;
        Control = 2'h3;
        #40;
        Control = 2'h0;
        #40;
        $stop;
	end

endmodule