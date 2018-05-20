module Part1(input logic KEY0,input logic [1:0]SW,output logic [3:0]HEX0,HEX1,HEX2,HEX3,output logic [1:0]LEDR);
	assign LEDR = SW;
	counter STB_TFF(KEY0,SW[0],SW[1],HEX0,HEX1,HEX2,HEX3);
endmodule