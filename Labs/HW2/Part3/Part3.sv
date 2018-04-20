//input logic vec_in_ci,vec_in_b,vec_in_a output logic vec_out_s,vec_out_c0
module Part3(input logic [8:0]SW output logic [0:6]HEX1,HEX0,output logic [8:0]LEDR);
	logic [3:0]vec_to_HEX0,vec_to_HEX1;
	LEDR = SW;
	FourBitAdder FBA(SW[8],SW[3:0],SW[7:4],vec_to_HEX0[3:0],vec_to_HEX1[0]);
	Decoder_part2 dec1(vec_to_HEX0,HEX0);
	Decoder_part2 dec2(vec_to_HEX1,HEX1);
endmodule