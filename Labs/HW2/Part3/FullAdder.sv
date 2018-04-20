module FullAdder(input logic vec_in_ci,vec_in_b,vec_in_a output logic vec_out_s,vec_out_c0);
    assign vec_out_s = vec_in_b ^ vec_in_a ^ vec_in_ci;
    assign vec_out_c0 = (vec_in_b ^ vec_in_a) ? vec_in_ci : vec_in[1];
endmodule

module FullAdder_testbench();
    logic vec_in_ci,vec_in_a,vecin_b,vec_out_s,vec_out_c0;
    integer i,j,k;

    FullAdder DUT(vec_in_ci,vec_in_a,vecin_b,vec_out_s,vec_out_c0);
    initial 
    begin
        $display("b:a:ci    s:c0");    
    end

    initial 
    begin
        vec_in_b = 0;vec_in_a = 0;vec_in_ci = 0;vec_out_c0 = 0;vec_out_s = 0;
        for(i = 0; i < 2; i++)
        begin
            $monitor("%b%b%b       %b%b%b",vec_in_b,vec_in_a,vec_in_ci,vec_out_c0,vec_out_s);
            vec_in_b = i;#10;
            for(j = 0; j < 2; j++)
            begin
                $monitor("%b%b%b       %b%b%b",vec_in_b,vec_in_a,vec_in_ci,vec_out_c0,vec_out_s);
                vec_in_a = j;#10;
                for(k = 0; k < 2; k++)
                begin
                    $monitor("%b%b%b       %b%b%b",vec_in_b,vec_in_a,vec_in_ci,vec_out_c0,vec_out_s);
                    vec_in_c0 = k;#10;
                end
            end
        end
    end
endmodule