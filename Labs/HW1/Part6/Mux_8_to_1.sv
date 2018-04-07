//a[0] = select bit 0     a[1] = select bit 1     a[2] = select bit 2
//a[11:3] = wires
module Mux_8_to_1(input [11:0]a, output z);
    assign w0 = a[0] ? a[4] : a[3];
    assign w1 = a[0] ? a[7] : a[6];
    assign w2 = a[0] ? a[9] : a[8];
    assign w3 = a[0] ? a[11] : a[10];

    assign w4 = a[1] ? w1 : w0;
    assign w5 = a[1] ? w3 : w2;

    assign z = a[2] ? w5 : w4;
endmodule