/**	A generic UART transmitter
 *	All functions are syncronous
 *	Ammon Dodson
 */

module UART_TX #(parameter WIDTH)( // WIDTH is the width of the data word
	input clk, reset, send,
	input[WIDTH-1:0] dataIn,
	output dataOut, ready
);
	// the internal state requires space for a start and stop bit
	localparam MAX_IDX = WIDTH+1;
	localparam CNT_SZ  = $clog2(WIDTH+1);
	
	logic[MAX_IDX:0] register;
	
	logic [CNT_SZ-1:0] count;
	
	
	assign register[MAX_IDX] = 1'b1; // the stop bit
	assign dataOut = register[0];
	
	//assign test = register;
	
	assign ready = !reset & (count == 0);
	
	always_ff @(posedge clk) begin
		if(!reset) begin
			if(ready & send) begin
				register[0] = 1'b0; // start bit
				count = CNT_SZ'(WIDTH+1);
			end else if(!ready) begin
				count--;
				register[0] = register[1];
			end
		end else begin
			count =0;
			register[0] =1'b1;
		end
	end
	
	
	genvar i;
	generate for(i=0; i<WIDTH; i++) begin: regs
		always_ff @(posedge clk) begin
			if(!reset) begin
				if(ready & send) begin
					register[i+1] = dataIn[i];
				end else if(!ready) begin
					register[i+1] = register[i+2];
				end
			end else begin
				register[i+1] = 1'b1;
			end
		end
	end endgenerate
endmodule


module UART_TX_tb;
	localparam WIDTH = 8;
	
	logic clk, reset, send;
	logic[WIDTH-1:0] dataIn;
	logic dataOut, ready;
	
	UART_TX #(WIDTH) DUT(clk, reset, send, dataIn, dataOut, ready);
	
	assign send = ready;
	
	initial begin
		dataIn = 8'h8a;
		reset=1;
		
		clk=0; #10; clk=1; #10;
		reset=0;
		clk=0; #10; clk=1; #10;
		
		for(int i =0; i<20; i++) begin clk=0; #10; clk=1; #10; end
		
	end
	
	
endmodule


