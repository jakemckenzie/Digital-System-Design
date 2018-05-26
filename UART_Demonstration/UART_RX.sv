
/**	A generic UART revceiver
 *	@param SAMPLES should be a power of 2
 */
module UART_RX #(parameter WIDTH, SAMPLES)(
	input clk, TxIn,
	
	output logic write,
	output logic [WIDTH-1:0] Data
);
	localparam INIT =3'h0,
	           IDLE =3'h1,
	           START=3'h2,
	           DATA =3'h3,
	           STOP =3'h4;
	
	logic[2:0] state;
	logic[SAMPLES:0] counter;
	logic[$clog2(WIDTH)-1:0] pos;
	
	
	/** SAMPLING **/
	
	logic sample;
	logic[$clog2(SAMPLES)-1:0] sampleSum;
	
	always_ff @(posedge clk) begin
		if(state == INIT) sampleSum = {$clog2(SAMPLES){1'b1}};
		if(TxIn) begin
			if(sampleSum<SAMPLES-1) sampleSum++;
		end else begin
			if(sampleSum>0) sampleSum--;
		end
		if(sampleSum>=SAMPLES/2) sample =1;
		else                    sample =0;
	end
	
	/** STATE MACHINE **/
	
	always_ff @(posedge clk) case(state)
		INIT: begin
			write = 0;
			state  = IDLE;
		end
		
		IDLE: begin
			write=0;
			if(sample==0) begin
				state = START;
				counter = 0;
			end
		end
		
		START: if(counter == (SAMPLES + SAMPLES/2 -1)) begin
			Data[0] = sample;
			counter =0;
			pos =1;
			state = DATA;
		end else counter++;
		
		DATA: if(counter == SAMPLES-1) begin
			Data[pos] = sample;
			counter =0;
			if(pos == WIDTH-1) state = STOP;
			else pos++;
		end else counter++;
		
		STOP: if(counter == SAMPLES-1) begin
			if(sample) write =1;
			state = IDLE;
		end else counter++;
		
		default: state = INIT; // complain
	endcase
endmodule



module UART_RX_tb;
	parameter WIDTH=4, SAMPLES=4;
	logic [WIDTH-1:0] TXdata, RXdata;
	logic sampleClk, sendClk, line, sample;
	logic TXreset, TXsend, TXready;
	logic write;
	
	UART_RX #(WIDTH, SAMPLES) DUT(sampleClk, line, write, RXdata);
	
	// Xmit
	
	
	Pulser #(SAMPLES) pulser(sampleClk, sendClk);
	UART_TX #(WIDTH) Xmit(sendClk, TXreset, TXsend, TXdata, line, TXready);
	
	assign sample = DUT.sample;
	
	always begin
		sampleClk=0; #10; sampleClk=1; #10;
	end
	
	
	
	initial begin
		//$monitor($time, " st: %d smpl: %d sum: %d", DUT.state, DUT.sample, DUT.sampleSum);
		
		TXreset=0;
		TXsend =0;
		TXdata = 8'h0;
		#(20*SAMPLES*(WIDTH+2)) TXreset=1;
		
		wait(TXready);
		
		while(TXdata !=(1<<WIDTH)-1) begin
			TXsend=1;
			wait(!TXready);
			TXsend=0;
			
			wait(write);
			assert(TXdata == RXdata);
			#10 TXdata++;
			wait(TXready);
		end
		
		
		$stop;
	end
endmodule

