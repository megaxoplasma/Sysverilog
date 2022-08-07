`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ying Zhu
// 
// Create Date: 06/11/2021 06:15:41 PM
// Design Name: 
// Module Name: TriLED_Accel
// This module generates a PWM base on accelerometer value
//Then applies that to the tri color LED controls to change color
//SYSTEMVERILOG
//////////////////////////////////////////////////////////////////////////////////
longint duty_cycle = 1000;
longint PWM_max = 100000;
longint PWM_counter = 0;
//logic PWM_reset = 1;

module TriLED_Accel(
     //Single bit output for led colors
     input logic CLK, PWM_reset,
     output logic LED16_B = 0,
     output logic LED16_G = 0,
     output logic LED16_R = 0,
     
    output reg [7:0] SSEG_AN,
    output reg [7:0] SSEG_CA
    );
    
    always @(posedge CLK) begin

    if(PWM_reset != 1) begin
        PWM_counter++;
        if( PWM_counter < duty_cycle)
            LED16_B <= 1;
        if ( PWM_counter > duty_cycle )
            LED16_B <= 0;
        if(PWM_counter > PWM_max) begin
            PWM_counter <= 0;
//            use this to test duty cycle change if needed
//            duty_cycle = duty_cycle + 1;
            end //end max if
     end //end reset if
     else begin //else of reset
     PWM_counter <= 0;
     LED16_B <= 1 ;      
    end // end else if reset 
        
    end // end always
    
    SevenSegController SSEG
    (.CLK(CLK), 
     .SSEG_AN(SSEG_AN), //(Internal -> External)
     .SSEG_CA(SSEG_CA)
    );
    
endmodule
