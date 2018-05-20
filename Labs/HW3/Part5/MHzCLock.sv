//This is a MHz clock. We were provided a kHz clock and I had the hardest
//getting my own example to go. Essentially every clock signal this increments a counter. When the counter reaches the desired amount.
// 5*10^7 - 1 we obtain a pulse which is sent to my counter module.
module MHzCLock(Clock, Out );
    input Clock;       // system (50 MHz) clock
    output logic Out;  // 1 MHz signal
      
    logic [25:0] Q = 26'd0;
    
    parameter MaxCount = 26'd49_999_999;
    
    always_ff @( posedge Clock ) begin
        if ( Q == MaxCount) begin // time to do something
            Q <= 0;       // reset the counter
            Out <= 1'b1;  // output the signal
          end
        else begin  // just count
            Q <= Q + 1'b1;  // inc the counter 
            Out <= 1'b0;    // output a zero
          end
    end
    
    
  endmodule
  //This is the testbench provided with this module, modified to match our usecase. It performs
  //as I expect. Once a second it outputs a pulse.
  `timescale 1 ps/1 ps
  module MHzCLock_testbench;
      integer unsigned i;
      logic Clock = 0;  // system clock
      logic Sig;    // 1 KHz signal
      
      MHzCLock DUT( Clock, Sig );
      
      always begin
        Clock = 0;
          #1;
          Clock = 1'b1;
          #1;
          
      end
      
      initial begin
        #2_000_000_100 $stop;
      end
  endmodule