/* Authors:		Ammon Dodson & Jake McKenzie
 * Date:		May 25, 2018
 * Title:		UART LABORATORY ASSIGNMENT
 * Introduction:The most ubiquitous serial port adapters found within microcontrollers 
 *				today are universal asynchronous receiver transmitters (UART). UART traces
 *				it’s roots back to Gordon Bell who developed it for the PDP series of 
 *				computers. In this laboratory assignment we will demonstrate this serial
 *				communication, both by sending and receiving, between two Altera DE2-115
 *				8-N-1, a common shorthand for a serial port setting in which there are 
 *				eight data bits, no parity bits and one stop bit. The primary objective
 *				of this laboratory report is to gain experience with UART’s and these other
 *				common techniques associated with UART. The primary problem associated with
 *				UART is to ensure synchronization of an asynchronous signal.
 *
 *This module:	In this module we instantiate two modules. Feeding them the needed clock
 *				which was asked of us in the assignment specifcations.
 */

module LabA(input CLOCK_50,input [0:0]KEY,output [1:1]GPIO);
	logic Clock,Reset,Enable,TxEmpty,XMitGo,TxOut;
	logic [7:0]TxData;
	
	assign Reset    = KEY[0];
	assign GPIO[1]  = TxOut;
	
	// produce 38_400 baud signal
	Pulser #(1302) UART_clock(CLOCK_50, Clock);
	
	UART_TX #(8) xmit(Clock, Reset, XMitGo, TxData, TxOut, TxEmpty);
	
	TXDriver #(50_000_000) TXD(CLOCK_50,Reset,TxEmpty,XMitGo,TxData);
endmodule
