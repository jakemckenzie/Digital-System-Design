//input logic vec_in_ci,vec_in_b,vec_in_a output logic vec_out_s,vec_out_c0
module FourBitAdder(input logic vec_in_ci,vec_in_b[3:0],vec_in_a[3:0] output logic [3:0]vec_out_s,output logic c_out);
	//logic [3:0]S_out;
	logic [2:0]vec_c_out;
	FullAdder FA1(vec_in_ci,[0]vec_in_b,[0]vec_in_a,[0]vec_c_out,[0]vec_out_s);
	FullAdder FA2([0]vec_c_out,[1]vec_in_b,[1]vec_in_a,[1]vec_c_out,[1]vec_out_s);
	FullAdder FA3([1]vec_c_out,[2]vec_in_b,[2]vec_in_a,[2]vec_c_out,[2]vec_out_s);
	FullAdder FA4([2]vec_c_out,[3]vec_in_b,[3]vec_in_a,[3]vec_c_out,[3]vec_out_s);
endmodule