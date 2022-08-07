`timescale 1ns / 1ps
`include "test.sv"
`include "interface.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ying Zhu

//////////////////////////////////////////////////////////////////////////////////
module Adder_TB();
bit clk;
bit reset;

//clock driver
always #5 clk = ~clk;

//reset

//Instantiate interface
interf i_interf(clk);

//test case program
test test1(i_interf);

//DUT(Design under test
Adder_Design DUT(
.clk(i_interf.clk),
.reset(i_interf.reset),
.bitA(i_interf.bitA),
.bitB(i_interf.bitB),
.sum(sum)
);
//link dump file of wave graph
initial begin
    $dumpfile("dump.vcd"); $dumpvars;
end


endmodule
