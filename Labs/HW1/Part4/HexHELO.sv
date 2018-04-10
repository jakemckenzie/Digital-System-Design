module HexHELO(Hex,C);
    input  [2:0]C;   // input lines
    output [0:6]Hex;  // the seven segments
    //always_comb
    //always_comb
    //begin
    //    case(C)
    //        2'h0: Hex = 7'h48;  //H
    //        3'h1: Hex = 7'h30;  //E
    //        3'h2: Hex = 7'h71;  //L
    //        3'h3: Hex = 7'h1;   //O
    //        default: Hex = 7'h7F;
    //    endcase    
    //end
    Assign H[0] = C[2] & C[1];
    Assign H[1] = ((~C[2]) & (~C[1]) & (~C[0])) | ((~C[2]) & C[1] & C[0]);
    Assign H[2] = ((~C[2]) & (~C[1]) & (~C[0])) | ((~C[2]) & C[1] & C[0]);
    Assign H[3] = ((~C[2]) &  & (C[0])) | ((~C[2]) & C[1] );
    Assign H[4] = (~C[2]);
    Assign H[5] = (~C[2]);
    Assign H[6] = ((~C[2]) & (~C[1]));
    //assign Hex[6] = 7'h09;
    //assign Hex[5] = 7'h06;
    //assign Hex[4] = 7'h27;
    //assign Hex[3] = 7'h20;
    //assign Hex[2] = 7'h7F;
    //assign Hex[1] = 7'h7F;
    //assign Hex[0] = 7'h7F;
endmodule