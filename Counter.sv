module Counter(input logic Clock,output logic Enable);
	logic [9:0]Counter = 0;
	assign Enable = (Counter == 10'd0);//enable for the data transmission
    always_ff @(posedge Clock) begin 
        // 50000000/38400 = 0x516
        Counter <= (Counter == 10'h516) ? 10'h0 : Counter + 10'h1;
    end
endmodule