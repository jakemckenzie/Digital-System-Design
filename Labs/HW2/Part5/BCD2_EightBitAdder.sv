//SW[16:0],ci,vec_to_decimal[8:0]
module BCD2_EightBitAdder(input logic [16:0]SW,input logic ci,output logic [8:0]vec_to_decimal);
    BCD2_FourBitAdder BCD2_FBA1(SW[16],SW[3:0],SW[11:8],vec_to_decimal[3:0],ci);
    BCD2_FourBitAdder BCD2_FBA2(ci,SW[7:4],SW[15:12],vec_to_decimal[7:4],vec_to_decimal[8]);
endmodule

module BCD2_EightBitAdder_testbench();
	logic ci;
    logic [16:0]SW;
    logic [8:0]vec_to_decimal;
    integer i,j,k;

    BCD2_EightBitAdder DUT(SW,ci,vec_to_decimal);
    initial 
    begin
        $display("B1:B0:A1:A0:    Output");    
    end

    initial 
    begin
        SW = 4'h0;
        for(i = 0; i < 256; i++)
        begin
            $monitor("%h%h%h       %h",SW[7:0],SW[15:8],ci,vec_to_decimal);
            SW[7:0] = i;#10;
            for(j = 0; j < 256; j++)
            begin
                $monitor("%h%h%h       %h",SW[7:0],SW[15:8],ci,vec_to_decimal);
                SW[15:8] = j;#10;
                for(k = 0; k < 2; k++)
                begin
                    $monitor("%h%h%h       %h",SW[7:0],SW[15:8],ci,vec_to_decimal);
                    ci = k;#10;
                    assert(vec_to_decimal == i + j + k);
                end
            end
        end
    end
endmodule