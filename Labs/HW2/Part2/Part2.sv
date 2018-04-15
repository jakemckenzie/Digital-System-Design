module Part2(input [3:0]SW, output [0:6]HEX1,HEX0, output [3:0]LEDG);
    assign LEDG = SW;
	wire = [3:0]psi,phi;
    Decoder_part2 Decoder_part2_1(psi[3:0],HEX1[0:6]); Decoder_part2 Decoder_part2_2(phi[3:0],HEX0[0:6]);
    
    always_comb
    begin
        case(SW)//input [3:0]foo, output [0:6]lambda
            4'h0: psi = 4'h0;phi = 4'h0;    //0
            4'h1: psi = 4'h0;phi = 4'h1;    //1
            4'h2: psi = 4'h0;phi = 4'h2;    //2
            4'h3: psi = 4'h0;phi = 4'h3;    //3
            4'h4: psi = 4'h0;phi = 4'h4;    //4
            4'h5: psi = 4'h0;phi = 4'h5;    //5
            4'h6: psi = 4'h0;phi = 4'h6;    //6
            4'h7: psi = 4'h0;phi = 4'h7;    //7
            4'h8: psi = 4'h0;phi = 4'h8;    //8
            4'h9: psi = 4'h0;phi = 4'h9;    //9
            4'hA: psi = 4'h1;phi = 4'h0;    //10
            4'hB: psi = 4'h1;phi = 4'h1;    //11
            4'hC: psi = 4'h1;phi = 4'h2;    //12
            4'hD: psi = 4'h1;phi = 4'h3;    //13
            4'hE: psi = 4'h1;phi = 4'h4;    //14
            4'hF: psi = 4'h1;phi = 4'h5;    //15
            default psi = 4'hF;phi = 4'hF;  //default signal is no display
        endcase
    end
endmodule