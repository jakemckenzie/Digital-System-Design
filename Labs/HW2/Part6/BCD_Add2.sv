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