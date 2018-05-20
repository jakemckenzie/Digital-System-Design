module Light(x1,x2,x3,F);
   
   input x1, x2, x3;
   
   output F;
	
	wire A,B,C;
	assign A = x3&(x1 | ~x2);
	assign B = x1&(~x2 | ~x3);
	assign C = x2&(x1 | ~x3);
   assign F = (A&B)|(A&C)|(B&C);
	
endmodule