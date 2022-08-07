`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ying Zhu
//////////////////////////////////////////////////////////////////////////////////

module Adder_Design(
    input clk,reset,
    input logic[3:0] bitA,
    input logic[3:0] bitB,
    output logic[4:0] sum
);

always
begin
if (reset == 1) begin
sum <= 0;
end //if reset
end //always

always @(posedge clk) begin
    if (reset != 1)
        sum <= (bitA + bitB);

end
endmodule






