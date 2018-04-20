module BCD_Decoder(input [3:0]foo, output logic [0:6]lambda);
    always_comb
    begin
        case(foo)
            4'h0: lambda = 7'h01;   //0
            4'h1: lambda = 7'h4F;   //1
            4'h2: lambda = 7'h12;   //2
            4'h3: lambda = 7'h06;   //3
            4'h4: lambda = 7'h4C;   //4
            4'h5: lambda = 7'h24;   //5
            4'h6: lambda = 7'h20;   //6
            4'h7: lambda = 7'h0F;   //7
            4'h8: lambda = 7'h00;   //8
            4'h9: lambda = 7'h04;   //9
            4'hA: lambda = 7'h7F;   //BLANK
            4'hB: lambda = 7'h7F;   //BLANK
            4'hC: lambda = 7'h7F;   //BLANK
            4'hD: lambda = 7'h7F;   //BLANK
            4'hE: lambda = 7'h7F;   //BLANK
            4'hF: lambda = 7'h7F;   //BLANK
            default: lambda = 7'h7F;//default signal is no display
        endcase    
    end
endmodule