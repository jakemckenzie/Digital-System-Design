module Part5(input logic [16:0]SW,output logic [0:6]HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0,output logic [16:0]LEDR,output logic [8:8]LEDG);
    logic [3:0]vec_to_HEX4,vec_to_HEX6;
    logic ci;
	logic [8:0]vec_to_decimal;
	//logic [8:0]vec_to_display;
	assign LEDR = SW;
    BCD2_FourBitAdder BCD2_FBA1(SW[16],SW[3:0],SW[11:8],vec_to_decimal[3:0],ci);
    BCD2_FourBitAdder BCD2_FBA2(ci,SW[7:4],SW[15:12],vec_to_decimal[7:4],vec_to_decimal[8]);
	 //BCD_Decoder Decoder_for_display0(vec_to_s,HEX0);
	//BCD_Decoder Decoder_for_display1(vec_to_c,HEX1);
	BCD2_Decoder_Decimal Decoder2_for_display(vec_to_decimal,HEX2,HEX1,HEX0);
    //BCD_Decoder Decoder_for_display4(vec_to_decimal[3:0],HEX0);
    //BCD_Decoder Decoder_for_display4(vec_to_decimal[7:4],HEX1);
    //BCD_Decoder Decoder_for_display4(vec_to_decimal[11:8],HEX2);
    BCD2_Decoder Decoder2_for_display4(SW[3:0],HEX4);
    BCD2_Decoder Decoder2_for_display5(SW[7:4],HEX5);
    BCD2_Decoder Decoder2_for_display6(SW[11:8],HEX6);
	BCD2_Decoder Decoder2_for_display7(SW[15:12],HEX7);
	always_comb
	begin
		if(SW[7:4] > 4'h9) LEDG[8] = 1'b1;
		else if(SW[3:0] > 4'h9) LEDG[8] = 1'b1;
		else if(SW[11:8] > 4'h9) LEDG[8] = 1'b1;
		else if(SW[15:12] > 4'h9) LEDG[8] = 1'b1;
		else LEDG[8] = 1'b0;
	end
endmodule

