module FullAdder(input logic ci,b,a, output logic s,c0);
    assign s = b ^ a ^ ci;
    assign c0 = (b ^ a) ? ci : b;
endmodule

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
        b = 0;a = 0;ci = 0;c0 = 0;s = 0;
        for(i = 0; i < 2; i++)
        begin
            $monitor("%b%b%b       %b%b%b",b,a,ci,c0,s);
            b = i;#10;
            for(j = 0; j < 2; j++)
            begin
                $monitor("%b%b%b       %b%b%b",b,a,ci,c0,s);
                a = j;#10;
                for(k = 0; k < 2; k++)
                begin
                    $monitor("%b%b%b       %b%b%b",b,a,ci,c0,s);
                    ci = k;#10;
                    assert(ci + b + a == s + c0 * 2);
                end
            end
        end
    end
endmodule