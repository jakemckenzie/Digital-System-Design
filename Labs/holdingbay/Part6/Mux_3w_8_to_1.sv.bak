//a[0] = select bit 0     a[1] = select bit 1     a[2] = select bit 2
//a[7:3] = wires
//input [7:0]mux_input,[2:0]select_bits, output z
module Mux_3w_8_to_1(input [23:0]mux_input,input [2:0]select_bits, output [2:0]z);
    Mux_8_to_1 Mux_8_to_1_part5_1(mux_input[7:0],select_bits[2:0],z[0]);
    Mux_8_to_1 Mux_8_to_1_part5_2(mux_input[15:8],select_bits[2:0]),z[1];
    Mux_8_to_1 Mux_8_to_1_part5_3(mux_input[23:16],select_bits[2:0],z[0]);
endmodule
