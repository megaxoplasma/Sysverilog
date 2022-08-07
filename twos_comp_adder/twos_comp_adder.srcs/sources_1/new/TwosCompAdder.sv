`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BBN Technologies
// Engineer: Ying Zhu
// 
// Create Date: 05/26/2021 03:37:32 PM
// Design Name: Ying Zhu
// Module Name: TwosCompAdder

//////////////////////////////////////////////////////////////////////////////////
module TwosCompAdder(
    input wire bitA, bitB, Cin,
    output wire sum, Cout
    );
    
assign sum = bitA ^ bitB ^ Cin;
assign Cout = (bitA * bitB) + Cin*(bitA ^ bitB) ;      
    
endmodule


