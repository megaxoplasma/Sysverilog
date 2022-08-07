//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ying Zhu
// 
// Create Date: 05/07/2021 
// Module Name: Hex2LED
//////////////////////////////////////////////////////////////////////////////////

module Hex2LED(
    input reg  [3:0] X,
    output reg [7:0] Y 
    );
    
always begin  //Initialize all Async
//Hex portion
case (X)
    'b0000 : Y <= 'b11000000;
    'b0001 : Y <= 'b11111001;
    'b0010 : Y <= 'b10100100;
    'b0011 : Y <= 'b10110000;
    'b0100 : Y <= 'b10011001;
    'b0101 : Y <= 'b10010010;
    'b0110 : Y <= 'b10000010;
    'b0111 : Y <= 'b11111000;
    'b1000 : Y <= 'b10000000;
    'b1001 : Y <= 'b10010000;
    'b1010 : Y <= 'b10001000; 
    'b1011 : Y <= 'b10000011; 
    'b1100 : Y <= 'b11000110; 
    'b1101 : Y <= 'b10100001; 
    'b1110 : Y <= 'b10000110; 
    default : Y <= 'b10001110; 
endcase
end
    
endmodule








