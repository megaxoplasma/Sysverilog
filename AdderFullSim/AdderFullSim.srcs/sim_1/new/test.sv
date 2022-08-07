`timescale 1ns / 1ps
`include "Environment.sv"

program test(interf interf); //gets pass a interface from Top_module

environment env;
initial begin
    //instantiate
    env = new(interf);
    //setting number of packets to transmit
    env.data_gen.packet_counter = 5;
    
    //run the thingy
    env.run();
end
endprogram
