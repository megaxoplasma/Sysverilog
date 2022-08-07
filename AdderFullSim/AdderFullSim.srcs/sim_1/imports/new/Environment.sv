`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"

class environment;
//Instantiate classes
generator data_gen;
driver data_driv;

mailbox mail;
virtual interf virt_interf;  //virtual [interface name] [instance name]

//Environment constructor
function new(virtual interf virt_interf);
//assign
this.virt_interf = virt_interf;

//mailbox
mail = new(); //default class constructor

//assign generator and driver for env
data_gen = new(mail);
data_driv = new(virt_interf,mail); 

endfunction

//Set up runs
task test();
    fork
    data_gen.main();
    data_driv.main();
    join_any //close fork
endtask

task verify_end();
    wait(data_gen.generate_end.triggered); //wait for generation end flag
    wait(data_gen.packet_counter == data_driv.transaction_count);
endtask

//run
task run;
    test();
    verify_end();
    $finish; 
    endtask
    
endclass

