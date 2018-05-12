module moduloTenCounter(input logic Clock, Reset,input logic [1:0]Control, output logic [3:0]toDisplay);
    logic [3:0]CurrentState,NextState,Sum;
    localparam naught = 2'h0,
               addOne = 2'h1,
               addTwo = 2'h2,
               subOne = 2'h3;
    always_comb begin
        case(Control)
            naught: Sum <= 4'h0;
            addOne: Sum <= Clock ? Sum + 4'h1 : Sum;
            addTwo: Sum <= Clock ? Sum + 4'h2 : Sum;
            subOne: Sum <= Clock ? Sum - 4'h1 : Sum;
            default: Sum <= 4'h0;
        endcase
    end
    
    always_ff @(posedge Clock, posedge Reset) begin
        CurrentState <= (Reset == 1) ? 4'h0 : NextState;
    end
    
    assign toDisplay = Sum;
endmodule

`timescale 1ns/1ns
module moduloTenCounter_testbench();
    //input logic Clock, Reset,input logic [1:0]Control output logic [3:0]toDisplay
    logic Clock,Reset;
    logic [1:0]Control;
    logic [3:0]toDisplay;

	moduloTenCounter DUT(Clock, Reset, Control, toDisplay); 
	
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
        toDisplay = 4'h0;
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