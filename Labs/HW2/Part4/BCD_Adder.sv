module BCD_Adder(input logic ci,b,a, output logic s,c0);
    assign s = b ^ a ^ ci;
    assign c0 = (b ^ a) ? ci : b;
endmodule