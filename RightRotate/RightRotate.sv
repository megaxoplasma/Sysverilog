module RightRotate (
	input logic CLK,
	input logic RESET,
	input logic [3:0] registerA,
	input logic [3:0] registerB,
	output logic check = 0
);


always @ (posedge CLK) begin
check <= check ^ check;

end
endmodule


module RightRotate_tb();

reg CLK;
reg RESET;
reg [3:0] registerA = 0;
reg [3:0] registerB = 0;
wire check;
int count = 0;

//Always section
//set clock
always begin
#10 CLK <= ~CLK;
//Async drivers

//rotate
registerB[3] <= registerA[0] ;
registerB[2] <= registerA[3] ;
registerB[1] <= registerA[2] ;
registerB[0] <= registerA[1] ;

end

initial 
begin
	CLK <= 0;
	RESET <= 0;
	registerA <= 4'h2;

end

//Always per clock section
always @ (posedge CLK) begin	
	count += 1;
	if (count == 5) begin
		registerA <= (registerA + 1);
		count = 0;
	end
end	


endmodule


