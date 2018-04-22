module BCD2_Decoder_Decimal(input logic [8:0]vec_to_display,output logic [0:6]vec_HEX2,vec_HEX1,vec_HEX0);
    logic [3:0]Hundreds,Tens,Ones;
    BCD2_Decoder BCD_For_HEX_Display2(Hundreds[3:0],vec_HEX2[0:6]);
    BCD2_Decoder BCD_For_HEX_Display1(Tens[3:0],vec_HEX1[0:6]);
	BCD2_Decoder BCD_For_HEX_Display0(Ones[3:0],vec_HEX0[0:6]);
    integer i;
    always_comb//https://stackoverflow.com/questions/47735552/updating-multiple-variables-in-case-statement
    begin
        //Thousands = 4'h0;
        Hundreds = 4'h0;
        Tens = 4'h0;
        Ones = 4'h0;
        for (i = 8; i >=0; i--)
        begin
            //if (Thousands >= 5) Thousands += 4'h3;
            if (Hundreds >= 5) Hundreds += 4'h3;
            if (Tens >= 5) Tens += 4'h3;
            if (Ones >= 5) Ones += 4'h3; 
            //Thousands <<=4'h1;
            //Thousands[0] = Hundreds[3];
            Hundreds <<=4'h1;
            Hundreds[0] = Tens[3];
            Tens <<=4'h1;
            Tens[0] = Ones[3];
            Ones <<=4'h1;
            Ones[0] = vec_to_display[i];
        end 
    end
endmodule