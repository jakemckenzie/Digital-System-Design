module Part4(SW,HEX0);
	input [17:15]SW;
   output [0:6]HEX0;
   HexHELO n(HEX0,SW);
endmodule