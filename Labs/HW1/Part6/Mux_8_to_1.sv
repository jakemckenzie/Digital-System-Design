//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module I made a eight to one mux by selecting between 8 variables, then four variables then two.
//  I didn't make a smaller module because that would increase the complexity of this program.
module Mux_8_to_1(input select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O, output z);
    logic wire_0,wire_1,wire_2,wire_3,wire_4,wire_5;
    assign wire_0 = select_bit1 ? BLANK2 : BLANK1;
    assign wire_1 = select_bit1 ? H : BLANK3;
    assign wire_2 = select_bit1 ? L1 : E;
    assign wire_3 = select_bit1 ? O : L2;

    assign wire_4 = select_bit2 ? wire_1 : wire_0;
    assign wire_5 = select_bit2 ? wire_3 : wire_2;

    assign z = select_bit3 ? wire_5 : wire_4;
endmodule
//  https://stackoverflow.com/questions/26207021/how-to-write-a-verilog-testbench-to-loop-through-4-inputs
//  For future assignments I will write a loop instead of hardcoding my inputs. I wrote this code before we got
//  to looping structures in class. In this test bench I select between the values that should be sent through the mux
//  and show that a unique value is being sent in by only changing that bit each time. The testbench appears to be
//  working correctly.
module Mux_8_to_1_testbench();
    reg select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O;
    wire z;
 
    Mux_8_to_1 DUT(select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O);
    initial begin
        select_bit3=0;select_bit2=0;select_bit1=0;BLANK1=0;BLANK2=0;BLANK3=0;H=0;E=0;L1=0;L2=0;O=0;#10;
        select_bit3=0;select_bit2=0;select_bit1=0;BLANK1=1;#10;
        select_bit3=0;select_bit2=0;select_bit1=0;BLANK1=0;#10;

        select_bit3=0;select_bit2=0;select_bit1=1;BLANK2=1;#10;
        select_bit3=0;select_bit2=0;select_bit1=1;BLANK2=0;#10;
        
        select_bit3=0;select_bit2=1;select_bit1=0;BLANK3=1;#10;
        select_bit3=0;select_bit2=1;select_bit1=0;BLANK3=0;#10;
        
        select_bit3=0;select_bit2=1;select_bit1=1;H=1;#10;
        select_bit3=0;select_bit2=1;select_bit1=1;H=0;#10;

        select_bit3=1;select_bit2=0;select_bit1=0;E=1;#10;
        select_bit3=1;select_bit2=0;select_bit1=0;E=0;#10;

        select_bit3=1;select_bit2=0;select_bit1=1;L1=1;#10;
        select_bit3=1;select_bit2=0;select_bit1=1;L1=0;#10;

        select_bit3=1;select_bit2=1;select_bit1=0;L2=1;#10;
        select_bit3=1;select_bit2=1;select_bit1=0;L2=0;#10;
        
        select_bit3=1;select_bit2=1;select_bit1=1;O=1;#10;
        select_bit3=1;select_bit2=1;select_bit1=1;O=0;#10;
    end
 
 endmodule // Mux_8_to_1_testbench