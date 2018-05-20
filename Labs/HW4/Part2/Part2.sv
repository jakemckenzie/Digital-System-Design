//     Jake McKenzie     |     TCES 330 Friday Section
//In part 2 I instantiate 2 modules and assign SW to LEDR. I send in each input to each
//module to obtain the desired output as requested in the assignment instructions.
module Part2(input logic KEY[0:0],input logic [2:0]SW,output logic [0:6]HEX0,output logic [2:0]LEDR);
    logic [3:0]foo;
	assign LEDR = SW;
    moduloTenCounter CNT(KEY[0],SW[0],SW[2:1],foo);
    hexDisplay HD(foo,HEX0);
endmodule