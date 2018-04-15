module Decoder_part2(input [3:0]foo, output [0:6]lambda);
    always_comb
    begin
        case(foo)
            4'h0: lambda = 7'h01;   //0
            4'h1: lambda = 7'h4F;   //1
            4'h2: lambda = 7'h12;   //2
            4'h3: lambda = 7'h06;   //3
            4'h4: lambda = 7'h4C;   //4
            4'h5: lambda = 7'h24;   //5
            4'h6: lambda = 7'h20;   //6
            4'h7: lambda = 7'h0F;   //7
            4'h8: lambda = 7'h00;   //8
            4'h9: lambda = 7'h04;   //9
            4'hA: lambda = 7'h08;   //A
            4'hB: lambda = 7'h60;   //B
            4'hC: lambda = 7'h31;   //C
            4'hD: lambda = 7'h42;   //D
            4'hE: lambda = 7'h30;   //E
            4'hF: lambda = 7'h38;   //E
            default: lambda = 7'h7F;//default signal is no display
        endcase    
    end
endmodule

module Decoder_part2_testbench();
    reg [3:0]foo;
    wire [0:6]lambda;
    integer i;
    Decoder_part2 DUT(foo,lambda);

    always_comb
    begin
        $monitor(foo,lambda);
        for(i = 0;i < 16;i++) 
        begin 
            foo = i;#10;
        end
    end
endmodule

