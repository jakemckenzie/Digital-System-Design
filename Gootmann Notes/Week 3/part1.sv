module part1(input [17:0]SW,output [17:0]LEDR,output [7:0]LEDG);
    assign LEDR = SW;
    ThreeOnes G1(SW[7:0],LEDG[0])
endmodule