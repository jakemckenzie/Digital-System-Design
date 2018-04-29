//     Jake McKenzie     |     TCES 330 Friday Section
//In this section we are creating a decoder to display the hex digits
//from 0 to F on a display. I do so by calling another module that does
//all the heavy lifting.
module Part1(input [15:0]SW, output [0:6]HEX3,HEX2,HEX1,HEX0);
    Decoder_part1 Decoder_part1_1(SW[15:12],HEX3[0:6]);//input [3:0]foo, output [0:6]lambda
    Decoder_part1 Decoder_part1_2(SW[11:8],HEX2[0:6]);
    Decoder_part1 Decoder_part1_3(SW[7:4],HEX1[0:6]);
    Decoder_part1 Decoder_part1_4(SW[3:0],HEX0[0:6]);
endmodule