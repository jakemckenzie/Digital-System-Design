`timescale 1s/1s

module TXDriver_testbench();
    //input logic Enable, Reset, TxEmpty, output logic XMitGo, output logic [7:0]TxData
    logic Enable, Reset, TxEmpty, XMitGo;
    logic [7:0]TxData;

    TXDriver DUT(Enable, Reset, TxEmpty, XMitGo,TxData);

    always begin
        Enable = 1'b0;
        #10;
        Enable = !Enable;
        #10;
    end
    
    assign TxEmpty = !XMitGo;
    
    initial begin
        //$display("State   |   Address   |   Reset   |   TxEmpty   |   XMitGo    |   TxData");
        $display("Reset   |   XMitGo   |   TxEmpty   |   TxData");
    end
    
    initial begin
        Reset = 1;
        //TxEmpty = 0;
        #1;
        Reset = 0;
        //TxEmpty = 1;
        //$monitor("      %d|      %d|     %b|     %d|     %d|     %c", State, Address, Reset, XMitGo, TxEmpty, TxData);
        $monitor("     %b|     %d|     %d|     %c", Reset, XMitGo, TxEmpty, TxData);
	    #1302;//((26.042*10^(-6))*(13*8))/(10^(-9))
	    $stop;
    end
endmodule
