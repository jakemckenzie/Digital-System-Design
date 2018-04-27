//     Jake McKenzie     |     TCES 330 Friday Section
//In this section I create a proper binary to BCD coverter for printing to the
//FPGA board. This is the double dabble algorithm commonly used in calculators
//for conversion of binary to BCD.
//https://en.wikipedia.org/wiki/Double_dabble
//
//No testbench was required for this part.
module BCD2_Decoder_Decimal(input logic [8:0]vec_to_display,output logic [0:6]vec_HEX2,vec_HEX1,vec_HEX0);
    logic [3:0]Hundreds,Tens,Ones;
    BCD2_Decoder BCD_For_HEX_Display2(Hundreds[3:0],vec_HEX2[0:6]);
    BCD2_Decoder BCD_For_HEX_Display1(Tens[3:0],vec_HEX1[0:6]);
	BCD2_Decoder BCD_For_HEX_Display0(Ones[3:0],vec_HEX0[0:6]);
    integer i;
    always_comb//https://en.wikipedia.org/wiki/Double_dabble
    begin
        Hundreds = 4'h0;
        Tens = 4'h0;
        Ones = 4'h0;
        for (i = 8; i >=0; i--)
        begin
            if (Hundreds > 4'h4) Hundreds += 4'h3;
            if (Tens > 4'h4) Tens += 4'h3;
            if (Ones > 4'h4) Ones += 4'h3; 
            Hundreds <<=4'h1;
            Hundreds[0] = Tens[3];
            Tens <<=4'h1;
            Tens[0] = Ones[3];
            Ones <<=4'h1;
            Ones[0] = vec_to_display[i];
        end 
    end
endmodule