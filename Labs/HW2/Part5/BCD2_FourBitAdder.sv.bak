//input logic vec_in_ci,vec_in_b,vec_in_a output logic vec_out_s,vec_out_c0
module BCD2_FourBitAdder(input logic ci,input logic [3:0]vec_in_b,vec_in_a, output logic [3:0]vec_out_s,output logic c_out);
	//logic [3:0]S_out;
	logic [2:0]vec_c_out;
	//input logic ci,b,a, output logic s,c0
	BCD_Adder FA1(ci,vec_in_b[0],vec_in_a[0],vec_out_s[0],vec_c_out[0]);
	BCD_Adder FA2(vec_c_out[0],vec_in_b[1],vec_in_a[1],vec_out_s[1],vec_c_out[1]);
	BCD_Adder FA3(vec_c_out[1],vec_in_b[2],vec_in_a[2],vec_out_s[2],vec_c_out[2]);
	BCD_Adder FA4(vec_c_out[2],vec_in_b[3],vec_in_a[3],vec_out_s[3],c_out);
endmodule