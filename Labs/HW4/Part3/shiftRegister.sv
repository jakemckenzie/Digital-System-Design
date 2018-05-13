//     Jake McKenzie     |     TCES 330 Friday Section
// In this module I shift each signal by one down. Essentially
// it is a diagonal where each prior input is the new output
// for the register bellow it in the cascade.
module shiftRegister(input logic [3:0]in1,input logic Clock,Reset,output logic [3:0]out1,out2,out3,out4,out5,out6,out7,out8);
    always_ff @(posedge Clock) begin
        out2 <= Reset ? 4'h0 : in1;
        out3 <= Reset ? 4'h0 : out2;
        out4 <= Reset ? 4'h0 : out3;
        out5 <= Reset ? 4'h0 : out4;
        out6 <= Reset ? 4'h0 : out5;
        out7 <= Reset ? 4'h0 : out6;
        out8 <= Reset ? 4'h0 : out7;
        out1 <= Reset ? 4'h0 : out8;
    end
endmodule