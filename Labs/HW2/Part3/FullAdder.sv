module FullAdder(input logic [2:0]in,output logic [1:0]out);
    assign out[0] = in[0] ^ in[1] ^ in[2];
    assign out[1] = (in[0] ^ in[1]) ? in[2] : in[1];
endmodule

module FullAdder_testbench();
    logic [2:0]in;
    logic [1:0]out;
    integer i;

    FullAdder DUT(in, out);
    initial 
    begin
        $display("a:b:ci    s:c0");    
    end

    initial 
    begin
        for(i = 0; i < 8; i++)
        begin
            in = i;#10;
            $monitor("%b    %b",in,out);
        end
    end
endmodule