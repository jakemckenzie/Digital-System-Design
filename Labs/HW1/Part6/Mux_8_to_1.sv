module Mux_8_to_1(input [7:0]mux_input,input[2:0]select_bits, output z);
    assign wire_0 = select_bits[0] ? mux_input[1] : mux_input[0];
    assign wire_1 = select_bits[0] ? mux_input[3] : mux_input[2];
    assign wire_2 = select_bits[0] ? mux_input[5] : mux_input[4];
    assign wire_3 = select_bits[0] ? mux_input[7] : mux_input[6];

    assign wire_4 = select_bits[1] ? wire_1 : wire_0;
    assign wire_5 = select_bits[1] ? wire_3 : wire_2;

    assign z = select_bits[2] ? wire_5 : wire_4;
endmodule

//module Mux_8_to_1_testbench();
//    reg [2:0]select_bits
//    reg [7:0]mux_input;
//    wire z;
 
//    Mux_8_to_1 DUT(mux_input[7:0],select_bits[2:0]);
//    initial begin
        //mux_input[0] = 0;mux_input[1] = 0;mux_input[2] = 0;mux_input[3] = 0;
//        //mux_input[4] = 0;mux_input[5] = 0;mux_input[6] = 0;mux_input[7] = 0;
//        //https://stackoverflow.com/questions/26207021/how-to-write-a-verilog-testbench-to-loop-through-4-inputs
//        mux_input[0] = 8'h2;
//        mux_input[1] = 8'h4;
//       mux_input[2] = 8'h8;
//        mux_input[3] = 8'h10;
//        mux_input[4] = 8'h20;
//        mux_input[5] = 8'h40;
//        mux_input[6] = 8'h80;
//        mux_input[7] = 8'h100;
//        select_bits = 8'h0;
//        always_comb begin
//            for (int i = 0; i < 9; i++) begin
//               #10;select_bits = i;
//            end
//        end
        
//    end
 
// endmodule // Mux_8_to_1_testbench