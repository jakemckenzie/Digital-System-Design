/** The UART Driver
 */

module TXDriver #(parameter DIVISOR)(
	input        Clock, Reset, TxEmpty,
	output logic XMitGo,
	output logic[7:0] TxData
);
	localparam MEM_MAX = 12;      //File lengths are done in 8 bit chunks.
	
	// these are our states
	localparam TX_INIT      = 3'h0, // initialize this module
	           TX_IDLE      = 3'h1, // waiting for next second
	           TX_SEND_DATA = 3'h2, // set XMitGo high
	           TX_WAIT      = 3'h3, // wait until UART is ready for next byte
	           TX_DATA_SENT = 3'h4; // set XMitGo low, increment address
	
	
	logic Enable;
	logic [7:0]Address; //SV_MALLOC;   //Bus for SV_Malloc and Memory
	logic [2:0]CurrentState = TX_INIT; //Current State for construction of FSM
	
	/********************************* MEMORY *********************************/
	
	ROM	ROM_inst (
	.address ( Address ),
	.clock ( Clock ),
	.q ( TxData )
	);
	
	//logic[7:0] mem[0:255] /* synthesis ram_init_file = "ROM.mif" */;
	
	//assign TxData = mem[Address];
	
	/******************************* END MEMORY *******************************/
	
	// produce the Enable signal
	Pulser #(DIVISOR) Enable_pulse(Clock, Enable);
	
	
	// Got the idea for this moore machine from this
	// http://web.mit.edu/6.111/www/f2017/handouts/L06.pdf
	always_ff @(posedge Clock) begin 
		if (Reset) begin
			case(CurrentState)
			TX_INIT: begin //Initalize The driver
				CurrentState <= TX_IDLE;
				XMitGo       <= 0;
				Address      <= 0;
			end
			
			// wait for enable, and the UART being ready
			TX_IDLE: if(Enable & TxEmpty) CurrentState <= TX_SEND_DATA;
			
			
			TX_SEND_DATA: begin // assert XMitGo until UART acknowleges
				XMitGo              <= 1;
				if(!TxEmpty) CurrentState  <= TX_DATA_SENT;
			end
			
			TX_DATA_SENT: begin // reset XMitGo. increment Address
				XMitGo       <= 0;
				if(Address == MEM_MAX) begin
					CurrentState <= TX_INIT;
				end else begin
					Address++;
					CurrentState <= TX_WAIT;
				end
			end
			
			TX_WAIT: begin
				if(TxEmpty) CurrentState <= TX_SEND_DATA;
			end
			
			default: CurrentState   <= TX_INIT; // Reset just-in-case
			endcase
		end else CurrentState <= TX_INIT;
	end
endmodule


`timescale 1 ps / 1 ps


module TXDriver_tb;
	logic      clk, reset, ready_in, send_out;
	logic[7:0] data;
	logic[7:0] mem[0:255];
	
	TXDriver #(50) DUT(clk, reset, ready_in, send_out, data);
	
	// send as soon as we are ready
	assign ready_in = !send_out;
	
	initial begin
		//$readmemh("ROM.hex", DUT.mem);
		reset=1;
		clk=0; #10; clk=1; #10;
		
		$display("Address | State | Output");
		$monitor("%h        %d       %c", DUT.Address, DUT.CurrentState, data);
		
		assert(send_out==0);
		reset=0;
		clk=0; #10; clk=1; #10;
		
		reset=1;
		clk=0; #10; clk=1; #10;
		
		for(int i=0; i<200; i++) begin clk=0; #10; clk=1; #10; end
	end
endmodule




