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
module hexDisplay(input logic [3:0]foo, output logic [0:6]lambda);
    always_comb
    begin
        case(foo)
            8'h20: lambda = 7'h7F; // ' '
            8'h48: lambda = 7'h48; // 'H'
            8'h65: lambda = 7'h30; // 'e'
            8'h6c: lambda = 7'h71; // 'l'
            8'h6f: lambda = 7'h01; // 'o'
            default: lambda = 7'h7F;//default signal is no display
        endcase    
    end
endmodule
//In this testbench I printed out each value then compared to the values needed
//in the assignment for each part. I never reach the default value of 0x7F which
//I expect and more importantly all values that are possible, which I tested for
//reach the needed values I want.
module hexDisplay_testbench();
    logic [3:0]foo;
    logic [0:6]lambda;
    integer i;
    Decoder_part2 DUT(foo,lambda);
    initial 
    begin
        $display("foo   lambda");
    end
    initial
    begin
        for(i = 0;i < 16;i++) 
        begin 
            foo = i;#10;
            //assert(foo == lambda);
            assert(lambda != 7'h7F);
            $monitor("%h    %h",foo,lambda);
        end
        $stop;
    end
endmodule