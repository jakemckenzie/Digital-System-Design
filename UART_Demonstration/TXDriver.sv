module TXDriver(input logic Clock, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData);
    parameter ROLLOVER = 38_399;
    parameter MIF_EOF_LENGTH = 16;

    logic [9:0]Counter = 0;
        
    assign Enable = (Counter == 9'd0);
    always_ff @(posedge Clock) begin 
        Counter <= (Counter == 9'h516) ? 9'h0 : Counter + 9'h1;
    end	
endmodule
