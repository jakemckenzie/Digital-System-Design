//     Jake McKenzie     |     TCES 330 Friday Section
//This is my main module. It assigns the switches to LEDR. It instantiates a four bit adder,
//then sends those results to a decoder for display on the FPGA board.
//
//The output onto the FPA board is in Hexidecimal. The display output was not specified
//and that made the most sense from the assignment instructions.
module Part3(input logic [8:0]SW, output logic [0:6]HEX1,HEX0,output logic [8:0]LEDR);
	logic [3:0]vec_to_s,vec_to_c;
	assign LEDR = SW;
	FourBitAdder FBA(SW[8],SW[3:0],SW[7:4],vec_to_s[3:0],vec_to_c[0]);
	Decoder_part2 Decoder_for_display1(vec_to_c,HEX1);
	Decoder_part2 Decoder_for_display2(vec_to_s,HEX0);
endmodule