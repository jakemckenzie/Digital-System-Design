//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  In this module we are instantiating eight, three wide eight to one mixes then passing in their outputs into five
//  seperate HexHELO modules to output to the seven segment display.
module Part6(input [17:0]SW,output[0:6]HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
   wire [24:0]yield;
    //input S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]m;
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_7(SW[15],SW[16],SW[17],SW[2:0],SW[2:0],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[8:6],SW[5:3],yield[17:15]);   
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_6(SW[15],SW[16],SW[17],SW[2:0],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[8:6],SW[5:3],SW[2:0],yield[20:18]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_5(SW[15],SW[16],SW[17],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[8:6],SW[5:3],SW[2:0],SW[2:0],yield[23:21]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_4(SW[15],SW[16],SW[17],SW[14:12],SW[11:9],SW[8:6],SW[8:6],SW[5:3],SW[2:0],SW[2:0],SW[2:0],yield[2:0]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_3(SW[15],SW[16],SW[17],SW[11:9],SW[8:6],SW[8:6],SW[5:3],SW[2:0],SW[2:0],SW[2:0],SW[14:12],yield[5:3]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_2(SW[15],SW[16],SW[17],SW[8:6],SW[8:6],SW[5:3],SW[2:0],SW[2:0],SW[2:0],SW[14:12],SW[11:9],yield[8:6]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_1(SW[15],SW[16],SW[17],SW[8:6],SW[5:3],SW[2:0],SW[2:0],SW[2:0],SW[14:12],SW[11:9],SW[8:6],yield[11:9]);
    Mux_3w_8_to_1 Mux_3w_8_to_1_Part6_0(SW[15],SW[16],SW[17],SW[5:3],SW[2:0],SW[2:0],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[8:6],yield[14:12]);

    HexHELO HexHELO_Part6_7(yield[2:0],HEX7[0:6]); 
    HexHELO HexHELO_Part6_6(yield[5:3],HEX6[0:6]); 
    HexHELO HexHELO_Part6_5(yield[8:6],HEX5[0:6]);
    HexHELO HexHELO_Part6_4(yield[11:9],HEX4[0:6]);
	 HexHELO HexHELO_Part6_3(yield[14:12],HEX3[0:6]);
	 HexHELO HexHELO_Part6_2(yield[17:15],HEX2[0:6]);
    HexHELO HexHELO_Part6_1(yield[20:18],HEX1[0:6]);
    HexHELO HexHELO_Part6_0(yield[23:21],HEX0[0:6]);
endmodule