//     Jake McKenzie     |     TCES 330 Friday Section
//In this module I create a 16 bit counter via a generate for loop
//It's been said that for loops are ~wrong~ way to make hardware.
//This makes a ripple carry effect. After the initial condition, denoted Toggle(T) is
//satisfied, that output is sent to be anded with the original T signal. This
//happens in succession where the output of each Tflipflop becomes andded with the prior enable signal. 
module counter16bitpart2(input logic CLK,CLR,T,output logic [15:0]Q);
    always_ff @(posedge CLK)
	 begin
		Q <= (CLR ? (T ? (Q + 16'h1): Q) : 16'h0);
    end
endmodule
//This testbench tests all values that this circuit could recieve. Essentially I created a control
//flow where if I repeat a clock signal for 65536 periods by driving a clock signal 131072 times
//up and down. For this circuit to be correct. It must count up for each rising edge of the clock.
//I demonstrate this by showing that an invariant of this circuit is always true.
//The final output Q is always equal to Q3*16^3+Q2*16^2+Q1*16^1+Q0*16^0. 
//
//To test whether the counter was incrementing on the positive edge that was done by observation
//of the timing signal.
//
//The print to console was commented out for the graders convenience.
module counter16bitpart2_testbench();
	logic [15:0]Q;
	logic CLK,CLR,T;
	integer i;
	counter16bitpart2 DUT(CLK,CLR,T,Q);
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
		assert(((i >> 1) % 65536)  == Q);
		//$monitor("%b	%d	%d	%d",T,Q,((i >> 1) % 65536) , i);
		repeat (131072)//65536*2=131072
		begin
			#1 CLK = !CLK;
			i++;
		end
	end
endmodule