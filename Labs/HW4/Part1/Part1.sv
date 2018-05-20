//     Jake McKenzie     |     TCES 330 Friday Section
//In part 1 I instantiate 2 modules and assign SW to LEDR. I send in each input to each
//module to obtain the desired output as requested in the assignment instructions.
module Part1(input logic KEY[0:0],input logic [1:0]SW,output logic LEDG[0:0],output logic [0:6]HEX0,output logic [1:0]LEDR);
    logic [3:0]foo;
	assign LEDR = SW;
    Part1FSM FSM(KEY[0],SW[1],SW[0],foo,LEDG[0]);
    hexDisplay HD(foo,HEX0);
endmodule