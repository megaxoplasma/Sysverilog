//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ying Zhu
//////////////////////////////////////////////////////////////////////////////////

module Adder_Design(
    input clk,reset,
    input logic[3:0] bitA = 1,
    input logic[3:0] bitB = 2,
    output wire[4:0] sum,
    
    reg [4:0] internal_sum
);

//always
//begin
//if (reset == 1) begin
//internal_sum <= 0;
//end //if reset
//end //always

always @(posedge clk) begin
    //if (reset != 1) begin
    internal_sum <= (bitA + bitB);
    //end
end

assign sum = internal_sum;
endmodule






