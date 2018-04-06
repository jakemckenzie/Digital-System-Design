module HexHELO(Hex,C);
    input  [2:0]C;   // input lines
    output [0:6]Hex;  // the seven segments
    
    always @(*)
    begin
        case(C)
            2'h0: Hex = 7'h48;
            3'h1: Hex = 7'h30;
            3'h2: Hex = 7'h71;
            3'h3: Hex = 7'h1;
            default: Hex = 7'h7F;
        endcase    
    end
endmodule