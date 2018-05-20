//     Jake McKenzie     |     TCES 330 Friday Section
// In this module I shift each signal by one down. Essentially
// it is a diagonal where each prior input is the new output
// for the register bellow it in the cascade.
module shiftRegister(input logic [3:0]in1,input logic Clock,Reset,output logic [3:0]out2,out3,out4,out5,out6,out7,out8,out1);
    always_ff @(posedge Clock) begin
        out2 <= Reset ? 4'h0 : in1;
        out3 <= Reset ? 4'h0 : out2;
        out4 <= Reset ? 4'h0 : out3;
        out5 <= Reset ? 4'h0 : out4;
        out6 <= Reset ? 4'h0 : out5;
        out7 <= Reset ? 4'h0 : out6;
        out8 <= Reset ? 4'h0 : out7;
        out1 <= Reset ? 4'h0 : out8;
    end
endmodule
//For this testbench we show by observation that the shift register
//works as intended. As i is pushed into the starting register, which
//each successive rising edge pulse the value is pushed the next register
//in a queue like fashion. No values enter the registers until we want them
//to. This works as expect.
module shiftRegister_testbench();
    logic [3:0]in1,out1,out2,out3,out4,out5,out6,out7,out8;
    integer i;
    logic Clock,Reset;

    shiftRegister DUT(in1,Clock,Reset,out2,out3,out4,out5,out6,out7,out8,out1);

    always begin
		Clock = 0;
		#5;
		Clock = 1;
		#5;
    end

    initial 
    begin
        $display("in1:out2:out3:out4:out5:out6:out7:out8:out1");
    end
    
    initial begin
        Reset = 0;
        for (i = 0; i < 11;i++) begin
            in1 = i; 
            $monitor("%h:%h:%h:%h:%h:%h:%h:%h:%h",in1,out2,out3,out4,out5,out6,out7,out8,out1);
            #10;
        end
        $stop;
    end
endmodule