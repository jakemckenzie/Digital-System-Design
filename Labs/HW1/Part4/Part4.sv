//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  For this module we instatiate one module for our seven segment display. Whoever came up with the standard
//  for seven segment displays really made life harder on students. We all made the mistake of having to deal
//  the fact that the display used little endian instead of big endian.
//
//  There are 2^7 possible states that the seven segment display can be in, allowing it to output all arabic
//  numerals and many latin characters, including A-F allowing seven segment displays to be used for hexidecimal
//  numbering systems. 
module Part4(input [17:15]SW,output [0:6]HEX0);
    HexHELO n(HEX0,SW);
endmodule