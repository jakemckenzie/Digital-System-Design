//TODO: Warning (10229): Verilog HDL Expression warning at Counter.sv(6): truncated literal to match 10 bits
//TODO: Warning (10236): Verilog HDL Implicit Net warning at TXDriver.sv(18): created implicit net for "TXData"
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(18): truncated value with size 8 to match size of target (1)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(46): truncated value with size 32 to match size of target (8)
//TODO: Warning (10230): Verilog HDL assignment warning at TXDriver.sv(50): truncated value with size 32 to match size of target (26)
//TODO: Warning (10034): Output port "TxData" at TXDriver.sv(1) has no driver


module TXDriver(input logic Enable, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData);
    parameter ROLLOVER = 38_399;
    parameter MIF_EOF_LENGTH = 16;//File lengths are done in 8 bit chunks.

    logic [7:0]Address,Data_Bus;
    logic [25:0]Counter = 0;
    logic [2:0]CurrentState = TX_INIT;
    logic [7:0]SV_MALLOC [0:255] /* synthesis ram_init_file = " sanity_test.mif" */;
    
    ROM_Memory RM(Enable,Address,Data_Bus);

    localparam TX_INIT          = 3'h0,
               TX_START         = 3'h1,
               TX_PROCESS_DATA  = 3'h2,
               TX_SEND_DATA     = 3'h3,
               TX_IDLE          = 3'h4;

    assign TXData = Data_Bus;
    
    always_ff @(posedge Enable) begin
        if (Reset) begin
            XMitGo      <= 0;
            Address     <= 0;
        end else begin
            case(CurrentState)
                TX_INIT: begin
                    CurrentState        <= TX_START;
                    XMitGo              <= 0;
                    Address             <= 0;
                end
                TX_START: begin
                    CurrentState        <= TxEmpty ? TX_PROCESS_DATA : TX_START;
                end
                TX_PROCESS_DATA: begin
                    if (!TxEmpty | MIF_EOF_LENGTH != Address) begin
                        XMitGo          <= 1;
                        CurrentState    <= TX_SEND_DATA;
                    end else begin
                        XMitGo          <= 0;
                        CurrentState    <= TX_IDLE;
                    end
                end
                TX_SEND_DATA: begin
                    CurrentState        <= TX_PROCESS_DATA;
                    XMitGo              <= 0;
                    Address              = Address + 1;
                end
                TX_IDLE: begin
                    if (Counter != ROLLOVER) begin
                        Counter          = Counter + 1;
                    end else begin
                        CurrentState    <= TX_INIT;
                    end
                end

                default: CurrentState <= TX_INIT;
            endcase
        end
    end
endmodule
