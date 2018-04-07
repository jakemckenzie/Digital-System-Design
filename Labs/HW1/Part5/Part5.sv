module Part5(input [17:0]SW,output[0:6]HEX4,HEX3,HEX2,HEX1,HEX0);
    wire [14:0]yield;
    //input S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]m
    //HEX4
	Mux_3w_5_to_1 Mux_3w_5_to_1_Part5_4(SW[15],SW[16],SW[17],SW[14:12],SW[11:9],SW[8:6],SW[5:3],SW[2:0],yield[2:0]);   
   HexHELO HexHELO_Part5_4(yield[2:0],HEX4[0:6]);
	//HEX3
	Mux_3w_5_to_1 Mux_3w_5_to_1_Part5_3(SW[15],SW[16],SW[17],SW[11:9],SW[8:6],SW[5:3],SW[2:0],SW[14:12],yield[5:3]);   
   HexHELO HexHELO_Part5_3(yield[5:3],HEX3[0:6]);
	//HEX2
	Mux_3w_5_to_1 Mux_3w_5_to_1_Part5_2(SW[15],SW[16],SW[17],SW[8:6],SW[5:3],SW[2:0],SW[14:12],SW[11:9],yield[8:6]);   
   HexHELO HexHELO_Part5_2(yield[8:6],HEX2[0:6]);
   //HEX1
	Mux_3w_5_to_1 Mux_3w_5_to_1_Part5_1(SW[15],SW[16],SW[17],SW[5:3],SW[2:0],SW[14:12],SW[11:9],SW[8:6],yield[11:9]);   
   HexHELO HexHELO_Part5_1(yield[11:9],HEX1[0:6]);
   //HEX0
	Mux_3w_5_to_1 Mux_3w_5_to_1_Part5_0(SW[15],SW[16],SW[17],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[5:3],yield[14:12]);   
   HexHELO HexHELO_Part5_0(yield[14:12],HEX0[0:6]);
endmodule

//ask about big endian vs little endian for input vs output
//use more asserts
//always put a $stop

//display = print
//monitor is printf

//You typically do things little endian