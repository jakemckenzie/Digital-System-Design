module Lab_Project_A(input CLOCK_50,input [0:0]KEY,output [1:1]GPIO);
	logic Clock,Reset,Enable,TxEmpty,XMitGo,TxOut;
	logic [7:0]TxData;
	
	assign Reset    = KEY[0];
	assign GPIO[1]  = TxOut;
	
	// produce 38_400 baud signal
	Pulser #(1302) UART_clock(CLOCK_50, Clock);
	
	UART_TX #(8) xmit(Clock, Reset, XMitGo, TxData, TxOut, TxEmpty);
	
	TXDriver #(50_000_000) TXD(CLOCK_50,Reset,TxEmpty,XMitGo,TxData);
endmodule
