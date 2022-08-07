`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ying Zhu 
// 
//////////////////////////////////////////////////////////////////////////////////
module SevenSegController(
    input CLK,
	output reg [7:0] SSEG_AN,
    output reg [7:0] SSEG_CA
    );
    bit [3:0] SSEG_Vect [0:7];
    int count_max = 100000;
    int count = 0;
    int Val_MAX = 9;
    reg [3:0] Val = 0;
    bit [7:0] HexIn;
//////////////////////////////////////7 seg controller section /////////////////////////////////
//Digits are incremented every second
initial begin
SSEG_Vect[0] <= 4'b0001;
SSEG_Vect[1] <= 4'b0010;
SSEG_Vect[2] <= 4'b0011;
SSEG_Vect[3] <= 4'b0100;
SSEG_Vect[4] <= 4'b0101;
SSEG_Vect[5] <= 4'b0110;
SSEG_Vect[6] <= 4'b0111;
SSEG_Vect[7] <= 4'b1000;

end

Hex2LED HexConvert(
//INNER -> OUT mapping
.X (HexIn),  
.Y (SSEG_CA)   //Outputs value for seven seg
);

//This process controls the counter that triggers the 7-segment
//to be incremented.   
always @ (posedge CLK)
begin
		if (count == count_max) begin
			count = 0; 
			Val <= Val + 1;
		end
		else 
			count <= count + 1;
        if (Val == Val_MAX) begin
            Val <= 0;
        end
end

//Hex display Anode Cathode section
//This statement selects the 7-segment diplay anode. Chose which one to update
always begin

case (Val)
 'b0001 : 	 SSEG_AN <= 'b01111111;
 'b0010 : 	 SSEG_AN <= 'b10111111;
 'b0011 : 	 SSEG_AN <= 'b11011111; 
 'b0100 : 	 SSEG_AN <= 'b11101111;
 'b0101 : 	 SSEG_AN <= 'b11110111;
 'b0110 : 	 SSEG_AN <= 'b11111011;
 'b0111 : 	 SSEG_AN <= 'b11111101;
 'b1000 : 	 SSEG_AN <= 'b11111110;
  default :  SSEG_AN <= 'b11111111;
endcase

//This select statement selects the value of HexVal
//cathode signals to display it on the 7-segment
//HexIn <= 'b0011;
case (Val)
 'b0001 : 	 HexIn <= SSEG_Vect[0];
 'b0010 : 	 HexIn <= SSEG_Vect[1];
 'b0011 : 	 HexIn <= SSEG_Vect[2]; 
 'b0100 : 	 HexIn <= SSEG_Vect[3];
 'b0101 : 	 HexIn <= SSEG_Vect[4];
 'b0110 : 	 HexIn <= SSEG_Vect[5];
 'b0111 : 	 HexIn <= SSEG_Vect[6];
 'b1000 : 	 HexIn <= SSEG_Vect[7];
  default :  HexIn <= SSEG_Vect[0];
endcase

end //End always
endmodule
