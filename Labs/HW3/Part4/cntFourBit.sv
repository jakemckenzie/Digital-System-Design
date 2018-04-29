module cntFourBit(input logic CLK,input logic [3:0]D,output logic [3:0]Q);
logic [25:0]c;

always_ff @(posedge CLK)
begin
	if (c < 50000000)
		c <= c + 26'b1;
	else
		begin
			c <= 26'b0;
			Q <= ((Q < D) ? Q + 4'b1 : 4'b0);
		end
end

endmodule