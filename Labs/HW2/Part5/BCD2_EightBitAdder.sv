//SW[16:0],ci,vec_to_decimal[8:0]
module BCD2_EightBitAdder(input logic [16:0]SW,input logic ci,output logic [8:0]vec_to_decimal);
	BCD2_FourBitAdder BCD2_FBA1(SW[16],SW[3:0],SW[11:8],vec_to_decimal[3:0],ci);
   BCD2_FourBitAdder BCD2_FBA2(ci,SW[7:4],SW[15:12],vec_to_decimal[7:4],vec_to_decimal[8]);
endmodule