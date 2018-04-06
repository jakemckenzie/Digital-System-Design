module Part5([17:0]SW,[2:0]yield,[0:6]Hex_Part5);
    //input [17:0]SW;
    //wire [2:0]yield;
    //output [0:6]Hex;
    //S0,S1,S2,input [2:0]u,v,w,x,y,output [2:0]
    Mux_3w_5_to_1 Mux_3w_5_to_1_Part5(SW[17],SW[16],SW[15],SW[14:12],SW[11:9],SW[8:6],SW[5:3,],SW[2:0],yield[2:0]);
    HexHELO HexHELO_Part5([2:0]yield,[0:6]Hex);


//ask about big endian vs little endian for input vs output
//use more asserts
//always put a $stop

//display = print
//monitor is printf

//You typically do things little endian