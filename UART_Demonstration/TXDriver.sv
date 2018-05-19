module TXDriver(input logic Clock, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData);
    parameter ROLLOVER = 38_399;
    parameter MIF_EOF_LENGTH = 16;

    logic [9:0]Counter = 0;
    logic [2:0]CurrentState = TX_INIT;
    logic [7:0] SV_MALLOC[0:255] /* synthesis ram_init_file = " data.mif" */;
    assign TxData = SV_MALLOC;
    localparam TX_INIT          = 3'h0,
               TX_START         = 3'h1,
               TX_PROCESS_DATA  = 3'h2,
               TX_SEND_DATA     = 3'h3,
               TX_IDLE          = 3'h4;

    assign Enable = (Counter == 9'd0);//enable for the data transmission
    always_ff @(posedge Clock) begin 
        Counter <= (Counter == 9'h516) ? 9'h0 : Counter + 9'h1;
    end
    
    always_ff @(posedge Enable) begin
        if (Reset) begin
            XMitGo <= 0;
        end else begin
            case(CurrentState)
                TX_INIT: begin
                    CurrentState        <= TX_START;
                    XMitGo              <= 0;
                    SV_MALLOC           <= 0;
                end
                TX_START: begin
                    CurrentState        <= TxEmpty ? TX_PROCESS_DATA : TX_START;
                end
                TX_PROCESS_DATA: begin
                    if (!TxEmpty | MIF_EOF_LENGTH != SV_MALLOC) begin
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
                    SV_MALLOC            = SV_MALLOC + 1;
                end
                TX_IDLE: begin
                    if (Counter != ROLLOVER) begin
                        Counter          = Counter + 1;
                    end else begin
                        CurrentState    <= TX_INIT;
                    end
                end
            endcase
        end
    end
endmodule
