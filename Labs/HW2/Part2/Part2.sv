module Part2(input [3:0]SW, output [0:6]HEX1,HEX0, output [3:0]LEDG);
    LEDG = SW;
    always_comb
    begin
        case(SW)
            4'h0: HEX1 = 4'h0;HEX0 = 4'h0;
            4'h1: HEX1 = 4'h0;HEX0 = 4'h1;
            4'h2: HEX1 = 4'h0;HEX0 = 4'h2;
            4'h3: HEX1 = 4'h0;HEX0 = 4'h3;
            4'h4: HEX1 = 4'h0;HEX0 = 4'h4;
            4'h5: HEX1 = 4'h0;HEX0 = 4'h5;
            4'h6: HEX1 = 4'h0;HEX0 = 4'h6;
            4'h7: HEX1 = 4'h0;HEX0 = 4'h7;
            4'h8: HEX1 = 4'h0;HEX0 = 4'h8;
            4'h9: HEX1 = 4'h0;HEX0 = 4'h9;
            4'hA: HEX1 = 4'h1;HEX0 = 4'h0;
            4'hB: HEX1 = 4'h1;HEX0 = 4'h1;
            4'hC: HEX1 = 4'h1;HEX0 = 4'h2;
            4'hD: HEX1 = 4'h1;HEX0 = 4'h3;
            4'hE: HEX1 = 4'h1;HEX0 = 4'h4;
            4'hF: HEX1 = 4'h1;HEX0 = 4'h5;
endmodule