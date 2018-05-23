
module TXDriver(
	input  Clock, Reset, TxEmpty,
	output logic XMitGo,
	output logic [7:0]TxData
	//output [7:0]mem [0:255]
);
    parameter MEM_MAX = 12;      //File lengths are done in 8 bit chunks.
	
	// these are our states
	localparam TX_INIT          = 3'h0,
               TX_SEND_DATA     = 3'h1,
               TX_DATA_SENT     = 3'h2,
               TX_IDLE          = 3'h3; // waiting for next second
	
	logic Enable;
    logic [7:0]Address; //SV_MALLOC;   //Bus for SV_Malloc and Memory
    logic [2:0]CurrentState = TX_INIT; //Current State for construction of FSM
    
	logic [0:12][7:0] mem ={ 8'd72, 8'd101 ,8'd108, 8'd108, 8'd111, 8'd32, 8'd87, 8'd111, 8'd114, 8'd108, 8'd100, 8'd33, 8'd10};
	
	//Pulser #(50_000_000) pulse(Clock, Enable); // enable once per second
	
	Pulser #(50) pulse(Clock, Enable);
	
    
                                                            //Got the idea for this moore machine from this
    always_ff @(posedge Clock) begin                       //http://web.mit.edu/6.111/www/f2017/handouts/L06.pdf
        TxData <= mem[Address];
        if (Reset) begin
            CurrentState <= TX_INIT;
        end else begin
            case(CurrentState)
            TX_INIT: begin //Initalize The driver
                CurrentState <= TX_IDLE;
                XMitGo <= 0;
                Address <= 0;
            end
            
            // wait for enable, and the UART being ready
            TX_IDLE: if(Enable & TxEmpty) CurrentState <= TX_SEND_DATA;
            
			TX_SEND_DATA: begin // assert XMitGo until UART acknowleges
				XMitGo <= 1;
				if(!TxEmpty) CurrentState <= TX_DATA_SENT;
			end
            
            TX_DATA_SENT: begin // reset XMitGo. increment Address
            	XMitGo <= 0;
            	if(Address == MEM_MAX) begin
            		CurrentState <= TX_INIT;
            	end else begin
            		Address++;
            		CurrentState <= TX_IDLE;
            	end
            end
            
            default: CurrentState   <= TX_INIT; // Reset just-in-case
            endcase
        end
    end
endmodule



// module TXDriver_tb;
// 	logic      clk, reset, ready_in, send_out;
// 	logic[7:0] data;
// 	logic[7:0] mem[0:255];
	
// 	TXDriver DUT(clk, reset, ready_in, send_out, data);
	
// 	assign ready_in = !send_out;
	
// 	initial begin
// 		reset=0;
// 		clk=0; #10; clk=1; #10;
		
// 		$monitor("send (XMitGo): %b", send_out);
		
// 		assert(send_out==0);
// 		reset=1;
// 		clk=0; #10; clk=1; #10;
		
// 		reset=0;
// 		clk=0; #10; clk=1; #10;
// 		for(int i=0; i<2000; i++) begin
// 			clk=0; #10; clk=1; #10;
// 		end
		
// 	end
	
// endmodule