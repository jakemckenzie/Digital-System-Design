module Mux_8_to_1(input [7:0]mux_input,[2:0]select_bits, output z);
    assign wire_0 = select_bits[0] ? mux_input[4] : mux_input[3];
    assign wire_1 = select_bits[0] ? mux_input[7] : mux_input[6];
    assign wire_2 = select_bits[0] ? mux_input[9] : mux_input[8];
    assign wire_3 = select_bits[0] ? mux_input[11] : mux_input[10];

    assign wire_4 = select_bits[1] ? wire_1 : wire_0;
    assign wire_5 = select_bits[1] ? wire_3 : wire_2;

    assign z = a[2] ? wire_5 : wire_4;
endmodule

module Mux_8_to_1_testbench();
    reg []select_bits
    reg [7:0]mux_input;
    wire z;
 
    Mux_8_to_1 DUT(mux_input[7:0],select_bits[2:0]);
    initial begin
        //mux_input[0] = 0;mux_input[1] = 0;mux_input[2] = 0;mux_input[3] = 0;
        //mux_input[4] = 0;mux_input[5] = 0;mux_input[6] = 0;mux_input[7] = 0;
        //https://stackoverflow.com/questions/26207021/how-to-write-a-verilog-testbench-to-loop-through-4-inputs
        always @ (*) begin
            for (int i = 0; i < 8; i++) begin
                mux_input[k] = 0;
            end
        end

        $monitor(mux_input[7:0]);
        always @(*)
            for (int i = 0; i < 8; i++) begin
                mux_input[7:0] = i;
                #10;
            end
        end
        
    end
 
 endmodule // Mux_5_to_1_testbench