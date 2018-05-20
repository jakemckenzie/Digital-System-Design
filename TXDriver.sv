//TODO: make the special .do files, instructions on canvas
//TODO: make sdc files
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(18): truncated value with size 8 to match size of target (1)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(46): truncated value with size 32 to match size of target (8)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(50): truncated value with size 32 to match size of target (26)
//TODO: Warning (10034): Output port "TxData" at TXDriver.sv(1) has no driver


module TXDriver(input logic Enable, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData);
    
    parameter ROLLOVER = 38_399;        //rollover for the counter.
    parameter MIF_EOF_LENGTH = 16;      //File lengths are done in 8 bit chunks.

    logic [7:0]Address,SV_MALLOC;        //Bus for SV_Malloc and Memory
    logic [25:0]Counter = 0;            //Counter for internal clock of TXDriver 
    logic [2:0]CurrentState = TX_INIT;  //Current State for construction of FSM
    //logic [7:0]SV_MALLOC [0:255] /* synthesis ram_init_file = " sanity_test.mif" */;
    ROM_Memory RM(Enable,Address,SV_MALLOC);//Rom memory.

    localparam TX_INIT                   = 3'h0,
               TX_START                  = 3'h1,
               TX_PROCESS_DATA           = 3'h2,
               TX_SEND_DATA              = 3'h3,
               TX_IDLE                   = 3'h4;

    assign TXData                        = SV_MALLOC;
                                                            //Got the idea for this moore machine from this
    always_ff @(posedge Enable) begin                       //http://web.mit.edu/6.111/www/f2017/handouts/L06.pdf
        if (Reset) begin
            XMitGo                      <= 0;
            Address                     <= 0;
            CurrentState                <= TX_INIT; 
        end else begin
            case(CurrentState)
                TX_INIT: begin                              //In the initial state is for setting indexes to zero and going to start
                    CurrentState        <= TX_START;
                    XMitGo              <= 0;
                    Address             <= 0;
                end
                TX_START: begin                             //If Empty go to process data, else stay in start
                    CurrentState        <= TxEmpty ? TX_PROCESS_DATA : TX_START;
                end
                TX_PROCESS_DATA: begin                      //If not empty or if you've not reached the file length set XMitGo high and go to send data
                    if (!TxEmpty | MIF_EOF_LENGTH != Address) begin
                        XMitGo          <= 1;
                        CurrentState    <= TX_SEND_DATA;
                    end else begin                          //If empty or reached the file length set XMitGo low and go to idle
                        XMitGo          <= 0;
                        CurrentState    <= TX_IDLE;
                    end
                end
                TX_SEND_DATA: begin                         //Go to process data set XMitGo low and increment the address 8 bits
                    CurrentState        <= TX_PROCESS_DATA;
                    XMitGo              <= 0;
                    Address              = Address + 1;
                end
                TX_IDLE: begin                              //Stay in idle unless you've hit rollover, wherein you go to the initial state
                    if (Counter != ROLLOVER) begin
                        Counter          = Counter + 1;
                    end else begin
                        CurrentState    <= TX_INIT;
                    end
                end

                default: CurrentState   <= TX_INIT;         //Initial state for moore vender
            endcase
        end
    end
endmodule

`timescale 1ns/1ns

module TXDriver_testbench();
    //input logic Enable, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData
    logic Enable, Reset, TxEmpty, XMitGo;
    logic [7:0]TxData;

    TXDriver DUT(Enable, Reset, TxEmpty, XMitGo,TxData);

    always begin
        Enable = 1'b0;
        #10;
        Enable = !Enable;
        #10;
    end
    initial begin
        $display("State   |   Address   |   Reset   |   TxEmpty   |   XMitGo    |   TxData");
    end
    initial begin
        Reset = 1;
        TxEmpty = 0;
        #100;
        Reset = 0;
        TxEmpty = 1;
        $monitor("      %d      %d,     %b,     %d,     %d,     %c ", State, Address, Reset, XMitGo, TxEmpty, TxData);
	    #2708368;//((26.042*10^(-6))*(13*8))/(10^(-9))
	    $stop;
    end
endmodule