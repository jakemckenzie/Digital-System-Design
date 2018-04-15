module Part2(input [3:0]SW, output [0:6]HEX1,HEX0, output [3:0]LEDG);
    assign LEDG = SW;
	 wire [3:0]psi,phi;
    Decoder_part2 Decoder_part2_1(psi[3:0],HEX1[0:6]); Decoder_part2 Decoder_part2_2(phi[3:0],HEX0[0:6]);
    
    always_comb//https://stackoverflow.com/questions/47735552/updating-multiple-variables-in-case-statement
    begin
        case(SW)//input [3:0]foo, output [0:6]lambda
            4'h0: begin
                psi = 4'h0;
                phi = 4'h0;//0
            end
            4'h1: begin
                psi = 4'h0;
                phi = 4'h1;//1
            end
            4'h2: begin
                psi = 4'h0;
                phi = 4'h2;//2
            end
            4'h3: begin
                psi = 4'h0;
                phi = 4'h3;//3
            end
            4'h4: begin
                psi = 4'h0;
                phi = 4'h4;//4
            end
            4'h5: begin
                psi = 4'h0;
                phi = 4'h5;//5
            end
            4'h6: begin
                psi = 4'h0;
                phi = 4'h6;//6
            end
            4'h7: begin
                psi = 4'h0;
                phi = 4'h7;//7
            end
            4'h8: begin
                psi = 4'h0;
                phi = 4'h8;//8
            end
            4'h9: begin
                psi = 4'h0;
                phi = 4'h9;//9
            end
            4'hA: begin
                psi = 4'h1;
                phi = 4'h0;//10
            end
            4'hB: begin
                psi = 4'h1;
                phi = 4'h1;//11
            end
            4'hC: begin
                psi = 4'h1;
                phi = 4'h2;//12
            end
            4'hD: begin
                psi = 4'h1;
                phi = 4'h3;//13
            end
            4'hE: begin
                psi = 4'h1;
                phi = 4'h4;//14
            end
            4'hF: begin
                psi = 4'h1;
                phi = 4'h5;//15
            end
        endcase
    end
endmodule

module Part2_testbench();
    reg SW;
    wire [0:6]HEX1,HEX0;
    wire [3:0]LEDG;
    integer i;
    Decoder_part2 DUT(SW,HEX1,HEX0,LEDG);

    always (*)
    begin
        $monitor(SW,HEX1,HEX0,LEDG);
        for(i = 0;i < 16;i++) 
        begin 
            SW <= i;#10;
        end
    end
endmodule

