module ThreeOnes(X,F);
    input [7:0]X;
    output logic F;

    integer unsigned I;
    always_comb begin
        F = 0;

        for (I = 0;I<6;I++) begin
            if (X[I]&X[I+1]&X[I+2])
            F=1;
        end 
    end
endmodule

module ThreeOnes_testbench();
    logic [7:0]X;
    logic X;
    
    ThreeOnes dut(X,F);
    
    integer unsigned I;
    initial begin
        X = 8'hFF;    
        for (I = 0;I<50;I++) begin
            #20 X = $urandom_range(0,256);
    end

    initial begin
        $monitorb ($stime,,,X,,,F);
    end
endmodule