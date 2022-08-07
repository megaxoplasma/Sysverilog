//Creator: Ying Zhu
//Design overview External input -> registerA -> rotates to registerB -> goes to HEX converter
// -> outputs to Cathode
module RightRotate_top (
	input reg CLK,
	//input reg RESET,
	input [3:0] registerA, //input from switches	
	//Wire delcarations
	
	//other declarations
	output reg [7:0] SSEG_AN,
    output reg [7:0] SSEG_CA
//    output logic LED = 1
	//bit [7:0][7:0] SEG_SEL  // 8bit register  x  8
);
    reg [3:0] registerB;  //output to hex
	int count_max = 10000000;
    int count = 0;
    int Val_MAX = 9;
    reg [3:0] Val = 0;
//Always section
//set clock
//#10 CLK <= ~CLK;  //Comment out for FPGA porting
////////////////////////////  Async drivers  //////////////////////////
//rotate
always begin
registerB[3] <= registerA[0] ;
registerB[2] <= registerA[3] ;
registerB[1] <= registerA[2] ;
registerB[0] <= registerA[1] ;
//Val <= registerB;
end

Hex2LED HexConvert(
.CLK (CLK),  //INNER -> OUT mapping
.X (registerB),  //Takes in Rotated value
.Y (SSEG_CA)   //Outputs value for seven seg
);

initial 
begin
	//CLK <= 0;
	//RESET <= 0;
	//registerA <= 4'h2; //comment out for porting
    //SEG_SEL = 1;
end

//////////////////////////////////////7 seg controller section /////////////////////////////////
//Digits are incremented every second

//This process controls the counter that triggers the 7-segment
//to be incremented. It counts 100,000,000 and then resets.		  
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
SSEG_AN <= 'b11111110;
//case (Val)
// 'b0001 : 	 SSEG_AN <= 'b01111111;
// 'b0010 : 	 SSEG_AN <= 'b10111111;
// 'b0011 : 	 SSEG_AN <= 'b11011111; 
// 'b0100 : 	 SSEG_AN <= 'b11101111;
// 'b0101 : 	 SSEG_AN <= 'b11110111;
// 'b0110 : 	 SSEG_AN <= 'b11011011;
// 'b0111 : 	 SSEG_AN <= 'b11011101;
// 'b1000 : 	 SSEG_AN <= 'b11011110;
//  default :  SSEG_AN <= 'b11111111;
//endcase

//This select statement selects the value of HexVal
//cathode signals to display it on the 7-segment
//SSEG_CA <= 0 ;
//case (Val)
//	default :  SSEG_CA <= SEG_SEL[0] ;
//				  NAME(1) when "0010",
//				  NAME(2)when "0011",
//				  NAME(3) when "0100",
//				  NAME(4) when "0101",
//				  NAME(5) when "0110",
//				  NAME(6) when "0111",
//				  NAME(7) when "1000",
//				  NAME(0) when others;
//endcase

end

endmodule


