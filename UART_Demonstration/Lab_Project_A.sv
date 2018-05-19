module Lab_Project_A(input logic CLOCK_50,input logic [0:0]KEY,output logic [1:0]GPIO);
    logic Clock,Reset,TxEmpty,XMitGo;
    logic [7:0]TxData;
    
    assign Clock = CLOCK_50;
    assign Reset = KEY;
    TXDriver TXD(Clock,RESET,TxEmpty,XMitGo,TxData);
endmodule