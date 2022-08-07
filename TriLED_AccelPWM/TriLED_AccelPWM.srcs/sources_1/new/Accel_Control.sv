`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ying Zhu

//////////////////////////////////////////////////////////////////////////////////


module Accel_Control(
    input logic SYSCLK; //System clock
    input logic RESET;
    
    //SPI Interface
    output logic RDY,SCLK, MOSI, SS;
    input logic  MISO;
    
    //Accel data
    input bit[11:0] ACCEL_MAG , ACCEL_TMP , ACCEL_X,ACCEL_Y,ACCEL_Z;

);
//CONSTANTS
int SYSCLK_FREQ = 108000000;
int SCLK_FREQ = 1000000
int NUM_READ = 16;
int INCRE_FREQ = 100;




endmodule


























