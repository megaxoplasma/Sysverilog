`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 06/21/2021 12:09:24 PM
// Design Name: Ying Zhu
// Module Name: SPI_interface
//////////////////////////////////////////////////////////////////////////////////
module SPI_interface(
    //Generic
    input SYSCLK, RESET, Start, Hold_SS,
    output Done,
    input reg [7:0] Din, 
    output reg [7:0] Dout,
    
    //Communications
    output logic SCLK, MOSI, SS,
    input MISO,
    
    int SYSCLK_FREQ = 108000000,
    int SCLK_FREQ = 1000000
    );
   
    const int DIV_FREQ = ((SYSCLK_FREQ/ (2*SCLK_FREQ) )- 1); //2x SCLK rate divider
    
    //Generate 2x SCLK and SCLK
    
    //Register Control
    wire ENABLE_SCLK, ENABLE_SS, ENABLE_SHIFT, ENABLE_LOAD_DOUT, ENABLE_LOAD_DIN;
    
    wire SHIFT_TICK_IN;
    wire SHIFT_TICK_OUT;
    
    //Conditional controllers
    wire Started_Shift;
    wire Finished_Shift;
    
    //Receive/sent counters
    int bit_count;
    wire count_reset;
    
    //Shift Registers
    reg [7:0] MOSI_REG ,MISO_REG;
    
    //Check flag
    wire CHECK;
    
    //State values to give
    const reg [7:0] STidle = 'b10100000; 
    const reg [7:0] STPrep = 'b00001001;
    const reg [7:0] STShift = 'b01011011;
    const reg [7:0] STDone = 'b00001110;
    
    //State registers
    reg [7:0] ST_Cur , ST_Nxt = STidle; //default idle
    //Declarations finished
    
    //Start assigning values
    assign ENABLE_LOAD_DIN = ST_Cur[7];
    assign ENABLE_SHIFT = ST_Cur[6];
    assign count_reset = ST_Cur[5];
    assign ENABLE_SCLK = ST_Cur[4];
    assign ENABLE_SS = ST_Cur[3];
    assign ENABLE_LOAD_DOUT = ST_Cur[2];
    
    initial begin
    
    if ( RESET == 0 && (Hold_SS == 1 | ENABLE_SS == 1) ) begin
    SS <= 0;
    end//if end
    MOSI <= MOSI_REG[7];  //Shift MOSI_REG data over MOSI line
    if (ENABLE_SCLK == 1) begin
    SCLK <= 1;
    end//if end
    end //end initial 
   /////////////////////////
   always @(posedge SYSCLK) begin
   //Operational
   if (ENABLE_LOAD_DOUT == 1) begin
        Dout <= MISO_REG;
   end //end if
   //Set done signal
   
   if (ENABLE_SHIFT == 1) begin
   MISO_REG[7:0] <= {MISO_REG[6:0] , MISO} ;
   end //if end
   
   
   end //end clock always
   
   always_comb begin
   //ST_Nxt <= ST_Cur;
   case (ST_Cur) 
   STidle : if (Start == 1) begin ST_Nxt <= STPrep; end
   STPrep : if (Started_Shift == 1) begin ST_Nxt <= STShift; end
   STShift : if (Finished_Shift == 1) begin ST_Nxt <= STDone; end
   STDone : ST_Nxt <= STidle;
   endcase
   
   end
   
   
   
   
   
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
