//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this part we used our knowledge from digital logic TCES 230 to design an encoder that would take
//  a 4 input signal and output a 7 segment signal for a hex based clock UI. Originally, due to how open
//  ended the assignment was written I used a simple case statment to set the display but then redid it
//  using boolean algebra as to follow the assignment specifications.
//
//	 For this part I reversed the order of my inputs needed to be so I flipped the order of the switches but
//	 kept this part correct.
module HexHELO(input [2:0]C,output [0:6]Hex);
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
	 //logic [0:6]H;
	 //C = C[2] B = C[1] A = C[0]
    assign Hex[0] = (~C[2]) | C[0];
    assign Hex[1] = C[0] | (C[1] ^ C[2]);
    assign Hex[2] = C[0] | (C[1] ^ C[2]);
    assign Hex[3] = C[0] | ((~C[1]) & (~C[2]));
    assign Hex[4] = C[0];
    assign Hex[5] = C[0];
    assign Hex[6] = C[0] | C[1];
	 //Hex = H;
endmodule