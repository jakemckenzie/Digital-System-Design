//a[0] = select bit 0     a[1] = select bit 1     a[2] = select bit 2
//a[7:3] = wires
//input [7:0]mux_input,[2:0]select_bits, output z
//SW[15],SW[16],SW[17],SW[2:0],SW[2:0],SW[2:0],SW[14:12],SW[11:9],SW[8:6],SW[8:6],SW[5:3],yield[2:0]
module Mux_3w_8_to_1(input select_bit1,select_bit2,select_bit3,input [2:0]H,E,L,O,BLANK1,BLANK2,BLANK3 output [2:0]z);
    Mux_8_to_1 Mux_8_to_1_part6_1(select_bit1,select_bit2,select_bit3,BLANK1[0],BLANK2[0],BLANK3[0],H[0],E[0],L[0],L[0],O[0],z[0]);
    Mux_8_to_1 Mux_8_to_1_part6_2(select_bit1,select_bit2,select_bit3,BLANK1[1],BLANK2[1],BLANK3[1],H[1],E[1],L[1],L[1],O[1],z[1]);
    Mux_8_to_1 Mux_8_to_1_part6_3(select_bit1,select_bit2,select_bit3,BLANK1[2],BLANK2[2],BLANK3[2],H[2],E[2],L[2],L[2],O[2],z[2]);
endmodule
