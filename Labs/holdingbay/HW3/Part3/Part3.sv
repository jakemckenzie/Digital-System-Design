module Part3(input logic [0:0]KEY,input logic [1:0]SW,output logic [0:6]HEX0,HEX1,HEX2,HEX3,output logic [1:0]LEDR);
	wire [15:0]Q;
	cntSixteen counter(KEY[0],SW[1],!SW[0],Q);
	hexDisplay hexD0(Q[3:0],HEX0);
	hexDisplay hexD1(Q[7:4],HEX1);
	hexDisplay hexD2(Q[11:8],HEX2);
	hexDisplay hexD3(Q[15:12],HEX3);
endmodule