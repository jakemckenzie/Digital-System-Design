//     Jake McKenzie     |     TCES 330 Friday Section
//In this module I create a finite state machine, that
//cycles between 0 and 8. When 4 or 8 are reached the output
//z is set to high.
//For the One-Hot step I do not know how to interpret the table
//that was output. For A the state appears to be reset but for all
//other states the state appears to be set to itself.
module Part1FSM(input logic Clock, w, Reset, output logic [3:0]y,output logic z);
    logic [3:0]CurrentState, NextState;
    localparam A = 4'h0,
               B = 4'h1,
               C = 4'h2,
               D = 4'h3,
               E = 4'h4,
               F = 4'h5,
               G = 4'h6,
               H = 4'h7,
               I = 4'h8;
    always_comb begin
        case (CurrentState)
            A: begin
                z = 0;
                if (!w) NextState = B;
                else NextState = F;
                end
            B: begin
                z = 0;
                if (!w) NextState = C;
                else NextState = F;
                end
            C: begin
                z = 0;
                if (!w) NextState = D;
                else NextState = F;
               end
            D: begin
                z = 0;
                if (!w) NextState = E;
                else NextState = F;
               end
            E: begin
                z = 1;
                if (!w) NextState = E;
                else NextState = F;
               end
            F: begin
                z = 0;
                if (w) NextState = G;
                else NextState = B;
               end
            G: begin
                z = 0;
                if (w) NextState = H;
                else NextState = B;
               end
            H: begin
                z = 0;
                if (w) NextState = I;
                else NextState = B;
               end
            I: begin
                z = 1;
                if (w) NextState = I;
                else NextState = B;
               end
            default: begin
                z = 0; 
                NextState = 4'h0;
            end
        endcase                  
    end
    always_ff @(posedge Clock, posedge Reset) begin
		if (Reset == 1)  CurrentState <= A;
		else  CurrentState <= NextState;
    end
    assign y = CurrentState;
endmodule
//This testbench creates a default clock then recreates the
//input signals exactly from the figure 1. This matches the diagram exactly.
`timescale 1ns/1ns
module Part1FSM_testbench();

	logic Clock, w, Reset;
	logic z;
	logic [3:0]y;

	Part1FSM DUT(Clock, w, Reset, y, z); 
	
	always begin
		Clock = 0;
		#5;
		Clock = 1;
		#5;
	end
	
	
    initial begin
        z = 0;
        y = 4'h0;
        w = 0;
        Reset = 0;
        #26;
        w = 1;
        #10;
        w = 0;
        #40;
        w = 1;
        #50;
        w = 0;
        #10;
		$stop;
	end

endmodule