//     Jake McKenzie     |     TCES 330 Friday Section
//This is the same decoder from part 1.
//
//In this module I used a case statement to apply a discrete transformation
//from a 4 wide vector to a 7 wide of the hex. For each mapping in 4-space for foo
//my input to the decoder there is a corresponding representation in 7-space.
//                       0
//                     #####  
//                  5 #     # 1
//                    #  6  #  
//                     #####  
//                  4 #     # 2
//                    #     # 
//                     #####
//                       3
//To represent each character this is how you do so on the display.
//The hard part of these displays is that on is low and high is off.
//So to represent 0 you need the 7th place to be zero so 0x0 maps
//to 0x01. 
//
//To turn off the display you need to set the vector to 0x7F which
//is my default state which is not needed for this assignment.
module BCD3_Decoder(input [3:0]foo, output logic [0:6]lambda);
    always_comb
    begin
        case(foo)
            4'h0: lambda = 7'h01;   //0
            4'h1: lambda = 7'h4F;   //1
            4'h2: lambda = 7'h12;   //2
            4'h3: lambda = 7'h06;   //3
            4'h4: lambda = 7'h4C;   //4
            4'h5: lambda = 7'h24;   //5
            4'h6: lambda = 7'h20;   //6
            4'h7: lambda = 7'h0F;   //7
            4'h8: lambda = 7'h00;   //8
            4'h9: lambda = 7'h04;   //9
            4'hA: lambda = 7'h08;   //A
            4'hB: lambda = 7'h60;   //B
            4'hC: lambda = 7'h31;   //C
            4'hD: lambda = 7'h42;   //D
            4'hE: lambda = 7'h30;   //E
            4'hF: lambda = 7'h38;   //F
            default: lambda = 7'h7F;//default signal is no display
        endcase    
    end
endmodule