//  GENERATOR
class generator;
//Generator generates stimulus inputs for driver to use on design testing

rand transaction trans;

//declare mailbox
mailbox mail;

//End event indicator
event generate_end;

//Packet counter control
int packet_counter;

//constructor
function new(mailbox mail);
    //get mailbox from environment and assign to internal
    this.mail = mail;
endfunction
    
task main();
    repeat(packet_counter) begin
    trans = new();
    if( !trans.randomize() ) $fatal("Gen:: trans random failed");
    mail.put(trans); 
    end
    -> generate_end; //Trigger end event
    $display("yayyyyyyyyyyyyyy");
endtask     
endclass  //end of generator