
/**	A generic UART revceiver
 *	@param SAMPLES should be a power of 2
 */
module UART_RX #(parameter WIDTH, PARITY, SAMPLES, BUF_ADDR_SZ)(
	input clk, TxIn,
	output [(2**BUF_ADDR_SZ)-1:0][WIDTH-1:0] Buffer,
	output [BUF_ADDR_SZ-1:0] writeAddr
);
	
	/** SAMPLING **/
	
//	localparam HALF_SAMPLE = SAMPLES/2;
//	logic[SAMPLES-1:0]         sampleBuffer;
//	logic[$clog2(SAMPLES)-1:0] sampleBufferIdx;
//	logic[$clog2(SAMPLES):0]   sampleSum;
//	
//	always_ff @(posedge clk) begin
//		sampleBuffer[sampleBufferIdx] = TxIn;
//		sampleBufferIdx++;
//	end
	
	logic sample;
	logic[$clog2(SAMPLES)-1:0] sampleSum;
	//localparam HIGH_CUT = (SAMPLES/2)+1, LOW_CUT = (SAMPLES/2)-1;
	
	always_ff @(posedge clk) begin
		if(TxIn) begin
			if(sampleSum<SAMPLES-1) sampleSum++;
		end else begin
			if(sampleSum>0) sampleSum--;
		end
		if(sampleSum>SAMPLES/2) sample =1;
		else                    sample =0;
	end
	
	/** WORD BUFFER **/
	
	localparam WORD_BUF_W = WIDTH + PARITY; // +1 for startbit
	logic[WORD_BUF_W-1:0] bitBuf;
	logic[$clog2(WORD_BUF_W)-1:0] pos;
	
	/** STATE MACHINE **/
	
	localparam INIT =3'h0,
	           IDLE =3'h1,
	           START=3'h2,
	           DATA =3'h3,
	           END  =3'h4;
	
	logic[1:0] state;
	
	logic[SAMPLES:0] counter;
	
	always_ff @(posedge clk) case(state)
		INIT: begin
			sample = 1;
			pos    = 0;
			state  = IDLE;
		end
		IDLE: if(sample==0) begin
			state = START;
			counter = 0;
		end
		START: if(counter == (SAMPLES + SAMPLES/2)) writeBitBuf;
		       else                                 counter++;
		
		DATA: if(counter == SAMPLES) writeBitBuf;
		      else                   counter++;
		
		END: if(counter == SAMPLES) begin
			if(sample) writeBitBuf;
			else state = IDLE; // we're desyncronized
		end else counter++;
		default: state = INIT; // complain
	endcase
	
	
	task writeBitBuf;
		bitBuf[pos] = sample;
		counter = 0;
		
		if(pos == WORD_BUF_W-1) state = END;
		else pos++;
	endtask
	
	
	
	
endmodule



module UART_RX_tb;
	parameter WIDTH=8, PARITY=0;
	parameter SAMPLES=16, BUF_ADDR_SZ=4;
	
	logic clk, TxIn;
	logic [(2**BUF_ADDR_SZ)-1:0][WIDTH-1:0] Buffer;
	logic [BUF_ADDR_SZ-1:0] writeAddr;
	
	UART_RX #(WIDTH, PARITY, SAMPLES, BUF_ADDR_SZ)
		DUT(clock, TxIn, Buffer, writeAddr);
	
	initial begin
		
	end
endmodule

