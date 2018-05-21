module LabA(input CLOCK_50,input [0:0]KEY,output logic [1:1]GPIO);
	logic Clock,Reset,Enable,TxEmpty,XMitGo,TxOut;
	logic [7:0]TxData;
	
	assign Reset    = KEY[0];
	assign GPIO[1]  = TxOut;
	assign Clock    = CLOCK_50;
	
	// produce 38_400 baud signal
	//Pulser #(1302) clock(CLOCK_50, Clock);
	Counter C(Clock,Enable);
	
	UART_TX #(8) xmit(Enable, Reset, XMitGo, TxData, TxOut, TxEmpty);
	
	
	
	

	 
	TXDriver TXD(Enable,Reset,TxEmpty,XMitGo,TxData);
endmodule
