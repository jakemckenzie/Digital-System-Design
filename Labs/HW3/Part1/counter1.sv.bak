module counter1(input logic CLK,CLR,T,output logic [3:0]out_HEX0,out_HEX1,out_HEX2,out_HEX3);
	logic Qtemp;
	genvar i;
	generate//input logic T,CLK,CLR,output logic Q
		for (i = 0; i < 16; i++) begin:TFFs
			if (i == 0) TFF tff1(T,CLK,CLR,Qtemp);
			else TFF1 tff2(Qtemp & T,CLK,CLR,Qtemp);
		end
	endgenerate
endmodule