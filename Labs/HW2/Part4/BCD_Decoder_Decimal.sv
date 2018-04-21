module BCD_Decoder_Decimal(input logic [7:0]vec_to_display,output logic [0:6]vec_HEX1,vec_HEX0);
    logic [3:0]psi,phi;
    BCD_Decoder BCD_For_HEX_Display1(psi[3:0],vec_HEX1[0:6]);
	 BCD_Decoder BCD_For_HEX_Display0(phi[3:0],vec_HEX0[0:6]);
    
    always_comb//https://stackoverflow.com/questions/47735552/updating-multiple-variables-in-case-statement
    begin
        case(vec_to_display)//input [3:0]foo, output [0:6]lambda
            8'h00: 
            begin
                psi = 4'h0;
                phi = 4'h0;//0
            end
            8'h01: 
            begin
                psi = 4'h0;
                phi = 4'h1;//1
            end
            8'h02: 
            begin
                psi = 4'h0;
                phi = 4'h2;//2
            end
            8'h03: 
            begin
                psi = 4'h0;
                phi = 4'h3;//3
            end
            8'h04: 
            begin
                psi = 4'h0;
                phi = 4'h4;//4
            end
            8'h05: 
            begin
                psi = 4'h0;
                phi = 4'h5;//5
            end
            8'h06: 
            begin
                psi = 4'h0;
                phi = 4'h6;//6
            end
            8'h07: 
            begin
                psi = 4'h0;
                phi = 4'h7;//7
            end
            8'h08: 
            begin
                psi = 4'h0;
                phi = 4'h8;//8
            end
            8'h09: 
            begin
                psi = 4'h0;
                phi = 4'h9;//9
            end
            8'h0A: 
            begin
                psi = 4'h1;
                phi = 4'h0;//10
            end
            8'h0B: 
            begin
                psi = 4'h1;
                phi = 4'h1;//11
            end
            8'h0C: 
            begin
                psi = 4'h1;
                phi = 4'h2;//12
            end
            8'h0D: 
            begin
                psi = 4'h1;
                phi = 4'h3;//13
            end
            8'h0E: 
            begin
                psi = 4'h1;
                phi = 4'h4;//14
            end
            8'h0F: 
            begin
                psi = 4'h1;
                phi = 4'h5;//15
            end
            8'h10: 
            begin
                psi = 4'h1;
                phi = 4'h6;//16
            end
            8'h11: 
            begin
                psi = 4'h1;
                phi = 4'h7;//17
            end
            8'h12: 
            begin
                psi = 4'h1;
                phi = 4'h8;//18
            end
            8'h13: 
            begin
                psi = 4'h1;
                phi = 4'h9;//19
            end
            8'h14: 
            begin
                psi = 4'h2;
                phi = 4'h0;//20
            end
            8'h15: 
            begin
                psi = 4'h2;
                phi = 4'h1;//21
            end
            8'h16: 
            begin
                psi = 4'h2;
                phi = 4'h2;//22
            end
            8'h17: 
            begin
                psi = 4'h2;
                phi = 4'h3;//23
            end
            8'h18: 
            begin
                psi = 4'h2;
                phi = 4'h4;//24
            end
            8'h19: 
            begin
                psi = 4'h2;
                phi = 4'h5;//25
            end
            8'h1A: 
            begin
                psi = 4'h2;
                phi = 4'h6;//26
            end
            8'h1B: 
            begin
                psi = 4'h2;
                phi = 4'h7;//27
            end
            8'h1C: 
            begin
                psi = 4'h2;
                phi = 4'h8;//28
            end
            8'h1D: 
            begin
                psi = 4'h2;
                phi = 4'h9;//29
            end
            8'h1E: 
            begin
                psi = 4'h3;
                phi = 4'h0;//30
            end
            8'h1F: 
            begin
                psi = 4'h3;
                phi = 4'h1;//31
            end
				default: 
					begin 
						psi = 4'h0;
						phi = 4'h0;
					end
        endcase
    end
endmodule