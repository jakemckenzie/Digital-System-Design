/* Authors:		Ammon Dodson & Jake McKenzie
 * Date:		May 25, 2018
 * Title:		UART LABORATORY ASSIGNMENT
 * Description:	This testbench just runs the driver for the
 *				transmitter. Because the driver is meant for
 *				transmitting, one need but run it to test it.
 */

`timescale 1s/1s

module TXDriver_testbench();
	logic Enable, Reset, TxEmpty, XMitGo;
	logic [7:0]TxData;

	TXDriver #(50) DUT(Enable, Reset, TxEmpty, XMitGo,TxData);

	always begin
		Enable = 1'b0;
		#10;
		Enable = !Enable;
		#10;
	end

	assign TxEmpty = !XMitGo;

	initial begin
		$display("Reset   |   XMitGo   |   TxEmpty   |   TxData");

		//$readmemh("ROM.hex", DUT.mem);
		Reset = 0;
		
		#100;
		Reset = 1;

		$monitor("     %b|     %d|     %d|     %c", Reset, XMitGo, TxEmpty, TxData);
		#6000;
		$stop;
	end
endmodule
