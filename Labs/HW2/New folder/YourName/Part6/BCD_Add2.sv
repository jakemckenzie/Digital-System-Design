//     Jake McKenzie     |     TCES 330 Friday Section
//This was the algorithm provided by robert gootman for adding BCD numbers
module BCD_Add2(input logic [3:0]A0,A1,B0,B1,output logic [8:0]dec);
    logic [4:0]T0,T1,Z0,Z1;
    logic C1,C2;
    always_comb
	 begin
        T0 = A0[3:0] + B0[3:0]; 
            
        if (T0 > 5'h9) 
        begin
        Z0 = 5'h10;
        C1 = 1'h1;
        end
        else
        begin
        Z0 = 5'h0;
        C1 = 1'h0;
        end

        dec[3:0] = T0 - Z0;
        T1 = A1[3:0] + B1[3:0] + C1;
          
        if (T1 > 5'h9)
        begin
        Z1 = 5'h10;
        C2 = 1'h1;
        end
        else
        begin
        Z1 = 5'h0;
        C2 = 1'h0;
        end
        dec[7:4] = T1 - Z1;
        dec[8] = C2;
	end
endmodule

module BCD_Add2_testbench();
    logic [3:0]A0,A1,B0,B1;
    logic [8:0]dec;
    integer i,j,m,n;

    BCD_Add2 DUT(A0,A1,B0,B1,dec);
    initial 
    begin
        $display("A0:A1:B0:B1    dec");    
    end

    initial 
    begin
        i = 0;j = 0;m = 0;n = 0;
        A0 = 4'h0;A1 = 4'h0;B0 = 4'h0;B1 = 4'h0;dec = 4'h0;
        for(i = 0; i < 4; i++)
        begin
            $monitor("%h%h%h%h       %b",A0,A1,B0,B1,dec);
            A0 = i;#10;
            for(j = 0; j < 7; j++)
            begin
                $monitor("%h%h%h%h       %b",A0,A1,B0,B1,dec);
                A1 = j;#10;
                for(m = 0; m < 4; m++)
                begin
                    $monitor("%h%h%h%h       %b",A0,A1,B0,B1,dec);
                    B0 = m;#10;
                    for(n = 0; n < 7; n++)
                    begin
                        $monitor("%h%h%h%h       %b",A0,A1,B0,B1,dec);
                        B1 = n;#10;
                        //assert(dec == i + j * 10 + m + n * 10);
                    end
                end
            end
        end
    end
endmodule