//     Jake McKenzie     |     TCES 330 Friday Section
//In this part I call the four bit adder then decode the signal to the display.
//
//Instead of adding in BCD then displaying the result I add in binary then covert to
//BCD. This does not follow the assignment instructions but it was expressly allowed
//by the instructor as it does not lose precision unlike the algorithm that was required.
//
//If values over 9 are displayed the LEDG comes on still.
module Part4(input logic [8:0]SW,output logic [0:6]HEX6,HEX4,HEX1,HEX0,output logic [8:0]LEDR,output logic [8:8]LEDG);
	logic [3:0]vec_to_HEX4,vec_to_HEX6;
	logic [7:0]vec_to_decimal;
	assign LEDR = SW;
	BCD_FourBitAdder BCD_FBA(SW[8],SW[3:0],SW[7:4],vec_to_decimal[3:0],vec_to_decimal[4]);
	BCD_Decoder_Decimal Decoder_for_display(vec_to_decimal,HEX1,HEX0);
	BCD_Decoder Decoder_for_display4(SW[3:0],HEX4);
	BCD_Decoder Decoder_for_display6(SW[7:4],HEX6);
	always_comb
	begin
		if(SW[7:4] > 4'h9) LEDG[8] = 1'b1;
		else if(SW[3:0] > 4'h9) LEDG[8] = 1'b1;
		else LEDG[8] = 1'b0;
	end
endmodule