module Part4(input logic [8:0]SW,output logic [0:6]HEX6,HEX4,HEX1,HEX0,output logic [8:0]LEDR);
    assign LEDR = SW;
    logic [3:0]vec_to_HEX0,vec_to_HEX1;
	assign LEDR = SW;
	BCD_Adder FBA(SW[8],SW[3:0],SW[7:4],vec_to_HEX1[3:0],vec_to_HEX0[0]);
	BCD_Decoder Decoder_for_display1(vec_to_HEX0,HEX6);
	BCD_Decoder Decoder_for_display2(vec_to_HEX1,HEX4);
endmodule