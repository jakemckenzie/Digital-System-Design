//  Jake McKenzie | Digital Systems Design | Homework 1
//
//  SystemVerilog allows variables to be set from a single continuous assignment statement. This removes the 
//  requirement for internal wires that would have been required in Verilog.
//
//  In this example we assigned red LEDs to our switches.

module Part1(input [17:0]SW,output [17:0]LEDR);
   assign LEDR = SW;
endmodule // part1