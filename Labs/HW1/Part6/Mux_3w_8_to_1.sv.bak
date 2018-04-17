//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module I instantiate three eight to one muxes.
module Mux_3w_8_to_1(input select_bit1,select_bit2,select_bit3,input [2:0]H,E,L1,L2,O,BLANK1,BLANK2,BLANK3, output [2:0]z);
    Mux_8_to_1 Mux_8_to_1_part6_1(select_bit1,select_bit2,select_bit3,BLANK1[0],BLANK2[0],BLANK3[0],H[0],E[0],L1[0],L2[0],O[0],z[0]);
    Mux_8_to_1 Mux_8_to_1_part6_2(select_bit1,select_bit2,select_bit3,BLANK1[1],BLANK2[1],BLANK3[1],H[1],E[1],L1[1],L2[1],O[1],z[1]);
    Mux_8_to_1 Mux_8_to_1_part6_3(select_bit1,select_bit2,select_bit3,BLANK1[2],BLANK2[2],BLANK3[2],H[2],E[2],L1[2],L2[2],O[2],z[2]);
endmodule
//  Like the 8 to one testbench I set unique values to each input then test to see whether that inpute is properly selected.
module Mux_3w_8_to_1_testbench();
    reg [2:0]H,E,L1,L2,O,BLANK1,BLANK2,BLANK3;
    reg select_bit1,select_bit2,select_bit3;
    wire [2:0]z;
 
    Mux_3w_8_to_1 DUT(select_bit1,select_bit2,select_bit3,H,E,L1,L2,O,BLANK1,BLANK2,BLANK3);
    initial begin
        H=1;E=2;L1=3;L2=4;O=5;BLANK1=6;BLANK2=8;BLANK3=5;
        select_bit1=0;select_bit2=0;select_bit3=0;#10;
        select_bit1=0;select_bit2=0;select_bit3=1;#10;
        select_bit1=0;select_bit2=1;select_bit3=0;#10;
        select_bit1=0;select_bit2=1;select_bit3=1;#10;
        select_bit1=1;select_bit2=0;select_bit3=0;#10;
        select_bit1=1;select_bit2=0;select_bit3=1;#10;
        select_bit1=1;select_bit2=1;select_bit3=0;#10;
        select_bit1=1;select_bit2=1;select_bit3=1;#10;
    end
 
 endmodule