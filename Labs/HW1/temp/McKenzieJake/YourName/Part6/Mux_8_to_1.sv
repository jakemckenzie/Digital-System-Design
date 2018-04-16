module Mux_8_to_1(input select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O, output z);
    //select_bit1,select_bit2,select_bit3,BLANK1[0],BLANK2[0],BLANK3[0],H[0],E[0],L[0],L[0],O[0],z[0]
    logic wire_0,wire_1,wire_2,wire_3,wire_4,wire_5;
    assign wire_0 = select_bit1 ? BLANK2 : BLANK1;
    assign wire_1 = select_bit1 ? H : BLANK3;
    assign wire_2 = select_bit1 ? L1 : E;
    assign wire_3 = select_bit1 ? O : L2;

    assign wire_4 = select_bit2 ? wire_1 : wire_0;
    assign wire_5 = select_bit2 ? wire_3 : wire_2;

    assign z = select_bit3 ? wire_5 : wire_4;
endmodule

module Mux_8_to_1_testbench();
    reg select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O;
    wire z;
 
    Mux_8_to_1 DUT(select_bit1,select_bit2,select_bit3,BLANK1,BLANK2,BLANK3,H,E,L1,L2,O);
    initial begin
        //mux_input[0] = 0;mux_input[1] = 0;mux_input[2] = 0;mux_input[3] = 0;
        //mux_input[4] = 0;mux_input[5] = 0;mux_input[6] = 0;mux_input[7] = 0;
        //https://stackoverflow.com/questions/26207021/how-to-write-a-verilog-testbench-to-loop-through-4-inputs
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