//input logic vec_in_ci,vec_in_b,vec_in_a output logic vec_out_s,vec_out_c0
module BCD_FourBitAdder(input logic ci,input logic [3:0]vec_in_b,vec_in_a, output logic [3:0]vec_out_s,output logic c_out);
	//logic [3:0]S_out;
	logic [2:0]vec_c_out;
	//input logic ci,b,a, output logic s,c0
	BCD_Adder FA1(ci,vec_in_b[0],vec_in_a[0],vec_out_s[0],vec_c_out[0]);
	BCD_Adder FA2(vec_c_out[0],vec_in_b[1],vec_in_a[1],vec_out_s[1],vec_c_out[1]);
	BCD_Adder FA3(vec_c_out[1],vec_in_b[2],vec_in_a[2],vec_out_s[2],vec_c_out[2]);
	BCD_Adder FA4(vec_c_out[2],vec_in_b[3],vec_in_a[3],vec_out_s[3],c_out);
endmodule

module BCD_FourBitAdder_testbench();
	logic ci,c_out;
	logic [3:0]vec_in_b,vec_in_a,vec_out_s;
    integer i,j,k;

    BCD_FourBitAdder DUT(ci,vec_in_b,vec_in_a,vec_out_s,c_out);
    initial 
    begin
        $display("b:a:ci    s:c0");    
    end

    initial 
    begin
        vec_in_b = 4'h0;vec_in_a = 4'h0;ci = 4'h0;
        for(i = 0; i < 16; i++) begin
            $monitor("%h%h%h       %h%h",vec_in_b,vec_in_a,ci,c_out,vec_out_s);
            vec_in_b = i;#10;
            for(j = 0; j < 16; j++) begin
                $monitor("%h%h%h       %h%h",vec_in_b,vec_in_a,ci,c_out,vec_out_s);
                vec_in_a = j;#10;
                for(k = 0; k < 2; k++) begin
                    $monitor("%h%h%h       %h%h",vec_in_b,vec_in_a,ci,c_out,vec_out_s);
                    ci = k;#10;
                    assert(16 * c_out +  vec_out_s == i + j + k);
                end
            end
        end
    end
endmodule