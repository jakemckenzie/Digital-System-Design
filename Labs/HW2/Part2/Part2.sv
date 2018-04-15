module Part2(input [3:0]SW, output [0:6]HEX1,HEX0, output [3:0]LEDG);
    LEDG = SW;

    always_comb
    begin
        case(SW)//input [3:0]foo, output [0:6]lambda
            4'h0: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h0,HEX0[0:6]);//0
            4'h1: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h1,HEX0[0:6]);//1
            4'h2: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h2,HEX0[0:6]);//2
            4'h3: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h3,HEX0[0:6]);//3
            4'h4: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h4,HEX0[0:6]);//4
            4'h5: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h5,HEX0[0:6]);//5
            4'h6: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h6,HEX0[0:6]);//6
            4'h7: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h7,HEX0[0:6]);//7
            4'h8: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h8,HEX0[0:6]);//8
            4'h9: Decoder_part2 Decoder_part2_1(4'h0,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h9,HEX0[0:6]);//9
            4'hA: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h0,HEX0[0:6]);//10
            4'hB: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h1,HEX0[0:6]);//11
            4'hC: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h2,HEX0[0:6]);//12
            4'hD: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h3,HEX0[0:6]);//13
            4'hE: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h4,HEX0[0:6]);//14
            4'hF: Decoder_part2 Decoder_part2_1(4'h1,HEX1[0:6]); Decoder_part2 Decoder_part2_2(4'h5,HEX0[0:6]);//15
endmodule