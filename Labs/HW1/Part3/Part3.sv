module Part3(SW,LEDG);
	input [17:0]SW;
	output [2:0]LEDG;
	//assign LEDR = SW;
	//input S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]m
   Mux_3w_5_to_1 f(SW[15],SW[16],SW[17],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],LEDG[2:0]);
endmodule
