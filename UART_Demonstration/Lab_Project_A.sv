module Lab_Project_A(input logic CLOCK_50,input logic [0:0]KEY,output logic [1:0]GPIO);
    logic Clock,Reset,Enable,TxEmpty,XMitGo,TxOut;
    logic [7:0]TxData;
    
    assign Clock    = CLOCK_50;
    assign Reset    = KEY;
    assign GPIO[1]  = TxOut;
	
	 Counter C(Clock,Enable);
    TXDriver TXD(Enable,Reset,TxEmpty,XMitGo,TxData);
endmodule