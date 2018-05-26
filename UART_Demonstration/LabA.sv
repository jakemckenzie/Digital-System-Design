/* Authors:			Ammon Dodson & Jake McKenzie
 * Date:				May 25, 2018
 * Title:			UART LABORATORY ASSIGNMENT
 *Description:		In this module we instantiate two modules. Feeding them the needed clock
 *						which was asked of us in the assignment specifcations.
 *FOR GRADER:		INSTRUCTIONS FOR RUNNING EACH TESTBENCH ARE BELOW.
 *TXDriver:			do testTXDriver.do
 *UART_TX:			do testUART_TX.do
 *UART_RX:			do testUART_RX.do
 *NOTES:				THESE TESTBENCHES MIGHT YELL ABOUT ATTEMPTING AND FAILING TO LOAD
 *						A VSIM.WLF FILE. THIS FILE IS MACHINE DEPENDENT AND IS NOT
 *						IMPORTANT. IN OTHER WORDS IT IS NOT A WARNING WORTH WORRYING ABOUT.
 *						THIS WAS DEVELOPED ON A WINDOWS AND LINUX MACHINE AND THIS FILE
 *						IS PRODUCES BASED ON YOUR OPERATING SYSTEM.
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
