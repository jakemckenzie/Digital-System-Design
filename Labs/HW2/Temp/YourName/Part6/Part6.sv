//     Jake McKenzie     |     TCES 330 Friday Section
//Part 6 is the diver for the rest of the modules. It First instatiates the algorithm provided by
//robert gootman feeding that otput into a 9 bit vector. Then that vector is sent into a decover.
//For convenience the switches are sent to each display for easy viewing.

module Part6(input logic [15:0]SW,output logic [0:6]HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0,output logic [16:0]LEDR,output logic [8:8]LEDG);
    
    logic [3:0]vec_to_HEX4,vec_to_HEX6;
    logic ci;
	logic [8:0]vec_to_decimal;
    
    assign LEDR = SW;
    
    BCD_Add2 bcd_add2(SW[3:0],SW[7:4],SW[11:8],SW[15:12],vec_to_decimal[8:0]);
    BCD3_Decoder_Decimal Decoder3_for_display(vec_to_decimal,HEX2,HEX1,HEX0);
    
    BCD3_Decoder Decoder3_for_display4(SW[3:0],HEX4);
    BCD3_Decoder Decoder3_for_display5(SW[7:4],HEX5);
    BCD3_Decoder Decoder3_for_display6(SW[11:8],HEX6);
	BCD3_Decoder Decoder3_for_display7(SW[15:12],HEX7);
    
    

endmodule