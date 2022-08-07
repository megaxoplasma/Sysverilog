`timescale 1ns / 1ps

module TwosCompAdder_tb();
    reg bitA ,bitB, Cin;
    wire Cout, sum;
  
TwosCompAdder DUT( .bitA(bitA), .bitB(bitB), .sum(sum), .Cin(Cin), .Cout(Cout) );  
localparam period = 20;

initial begin

bitA = 0;
bitB = 0;
Cin = 0;
#period;

bitA = 0;
bitB = 1;
Cin = 0;
#period;

bitA = 1;
bitB = 0;
Cin = 0;
#period;

bitA = 1;
bitB = 1;
Cin = 0;
#period;



end

endmodule
