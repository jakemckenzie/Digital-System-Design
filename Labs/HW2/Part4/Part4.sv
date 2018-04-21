module Part4(input logic [8:0]SW,output logic [0:6]HEX6,HEX4,HEX1,HEX0,output logic [8:0]LEDR,output logic [7:0]LEDG);
	logic [3:0]vec_to_s,vec_to_c,vec_to_HEX4,vec_to_HEX6;
	//logic [8:0]vec_to_display;
	assign LEDR = SW;
	BCD_FourBitAdder BCD_FBA(SW[8],SW[3:0],SW[7:4],vec_to_s[3:0],vec_to_c[0]);
	BCD_Decoder Decoder_for_display0(vec_to_s,HEX0);
	BCD_Decoder Decoder_for_display1(vec_to_c,HEX1);
	//BCD_Decoder_Decimal Decoder_for_display(vec_to_display);
	BCD_Decoder Decoder_for_display4(SW[3:0],HEX4);
	BCD_Decoder Decoder_for_display6(SW[7:4],HEX6);
	always @*
	begin
		if(SW[7:4] > 4'h8) LEDG = 8'h80;
		else if(SW[3:0] > 4'h8) LEDG = 8'h80;
		else LEDG = 8'h0;
	end
endmodule