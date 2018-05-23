//TODO: make the special .do files, instructions on canvas
//TODO: make sdc files
//TODO: Warning (10229): Verilog HDL Expression warning at Counter.sv(6): truncated literal to match 10 bits
//TODO: Warning (10236): Verilog HDL Implicit Net warning at TXDriver.sv(18): created implicit net for "TXData"
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(18): truncated value with size 8 to match size of target (1)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(46): truncated value with size 32 to match size of target (8)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(50): truncated value with size 32 to match size of target (26)
//TODO: Warning (10034): Output port "TxData" at TXDriver.sv(1) has no driver


//`timescale 1 ps / 1 ps

module TXDriver(
	input        Clock, Reset, TxEmpty,
	output logic XMitGo,
	output logic[7:0] TxData
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
    
//    (* ram_init_file = "ROM.mif" *)
//    logic [7:0]SV_MALLOC [0:255]; // /* synthesis ram_init_file = "ROM.mif" */;
    
    //logic [0:255][7:0]SV_MALLOC  /* synthesis ram_init_file = "ROM.mif" */;
    
    //ROM_Memory RM(Address,Clock,SV_MALLOC);//Rom memory.
    //assign mem = SV_MALLOC;
    
    //assign addr = Address;
    
    //assign TxData = 8'h58;
	
	
	logic [0:12][7:0] mem ={ 8'd72, 8'd101 ,8'd108, 8'd108, 8'd111, 8'd32, 8'd87, 8'd111, 8'd114, 8'd108, 8'd100, 8'd33, 8'd10};
	
//	initial begin
//		mem[0]  = 8'd72;
//		mem[1]  = 8'd101;
//		mem[2]  = 8'd108;
//		mem[3]  = 8'd108;
//		mem[4]  = 8'd111;
//		mem[5]  = 8'd32;
//		mem[6]  = 8'd87;
//		mem[7]  = 8'd111;
//		mem[8]  = 8'd114;
//		mem[9]  = 8'd108;
//		mem[10] = 8'd100;
//		mem[11] = 8'd33;
//		mem[12] = 8'd10;
//	end
	
	//Pulser #(50_000_000) pulse(Clock, Enable); // enable once per second
	
	Pulser #(50) pulse(Clock, Enable);
	
    
                                                            //Got the idea for this moore machine from this
    always_ff @(posedge Clock) begin                       //http://web.mit.edu/6.111/www/f2017/handouts/L06.pdf
        TxData <= mem[Address];
        
        if (Reset) begin
            CurrentState                <= TX_INIT;
        end else begin
            case(CurrentState)
            TX_INIT: begin //Initalize The driver
                CurrentState        <= TX_IDLE;
                XMitGo              <= 0;
                Address             <= 0;
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
            		CurrentState <= TX_IDLE;
            	end
            	end
            
            default: CurrentState   <= TX_INIT; // Reset just-in-case
            
//            TX_PROCESS_DATA: begin                      //If not empty or if you've not reached the file length set XMitGo high and go to send data
//                if (!TxEmpty | MIF_EOF_LENGTH != Address) begin
//                    XMitGo          <= 1;
//                    CurrentState    <= TX_SEND_DATA;
//                end else begin                          //If empty or reached the file length set XMitGo low and go to idle
//                    XMitGo          <= 0;
//                    CurrentState    <= TX_IDLE;
//                end
//            end
            
            
            
//                TX_START: begin                             //If Empty go to process data, else stay in start
//                    CurrentState        <= TxEmpty ? TX_PROCESS_DATA : TX_START;
//                end
            
                
//                TX_IDLE: begin                              //Stay in idle unless you've hit rollover, wherein you go to the initial state
//                    if (Counter != ROLLOVER) begin
//                        Counter         <= Counter + 1;
//                    end else begin
//                        CurrentState    <= TX_INIT;
//                    end
//                end
            endcase
        end
    end
endmodule



module TXDriver_tb;
	logic      clk, reset, ready_in, send_out;
	logic[7:0] data;
	logic[7:0] mem[0:255];
	//logic[2:0] state;
	
	TXDriver DUT(clk, reset, ready_in, send_out, data);
	
	assign ready_in = !send_out;
	
	initial begin
		reset=0;
		//ready_in=0;
		clk=0; #10; clk=1; #10;
		
		$monitor("send (XMitGo): %b", send_out);
		//$monitor("Addr: %h", addr);
		
		assert(send_out==0);
		reset=1;
		clk=0; #10; clk=1; #10;
		
		reset=0;
		clk=0; #10; clk=1; #10;
		
//		empty=0;
//		clk=0; #10; clk=1; #10;
		//ready_in=1;
		for(int i=0; i<2000; i++) begin
			clk=0; #10; clk=1; #10;
			
			//if(send_out) ready_in =0;
			
		end
		
	end
	
endmodule



