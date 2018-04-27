//     Jake McKenzie     |     TCES 330 Friday Section
//this is all you need for a full adder. The first expression creates the s output
//by xoring the three inputs then the second expression creates a carry out by
//seinding the xor(b,a) to a ternerary operator. If one is false and the other is true.
//c0 is equal to ci. If both are true or both are calse the carry out is equalto b.
module FullAdder(input logic ci,b,a, output logic s,c0);
    assign s = b ^ a ^ ci;
    assign c0 = (b ^ a) ? ci : b;
endmodule
//In this testbench I test for all values to be correct. My assert
//i + j + k == s + c0 * 2 is never false, which is the value I need 
//to be true inorder for the the module to be correct.
module FullAdder_testbench();
    logic ci,a,b,s,c0;
    integer i,j,k;

    FullAdder DUT(ci,a,b,s,c0);
    initial 
    begin
        $display("b:a:ci    s:c0");    
    end

    initial 
    begin
        b = 0;a = 0;ci = 0;
        for(i = 0; i < 2; i++)
        begin
            $monitor("%b%b%b       %b%b",b,a,ci,c0,s);
            b = i;#10;
            for(j = 0; j < 2; j++)
            begin
                $monitor("%b%b%b       %b%b",b,a,ci,c0,s);
                a = j;#10;
                for(k = 0; k < 2; k++)
                begin
                    $monitor("%b%b%b       %b%b",b,a,ci,c0,s);
                    ci = k;#10;
                    assert(i + j + k == s + c0 * 2);
                end
            end
        end
    end
endmodule