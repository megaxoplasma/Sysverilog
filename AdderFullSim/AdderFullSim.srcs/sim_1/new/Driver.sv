//DRIVER 

class driver;
//Allow driver the track transaction number
int transaction_count;

//create virtual interface handler
virtual interf virt_interf;

//create mail handler
mailbox mail;

//Driver constructor
function new(virtual interf virt_interf, mailbox mail);
//Assign interface
this.virt_interf = virt_interf;
//Assign mailbox
this.mail = mail;
endfunction

//main
task main;
    forever begin
        transaction trans;
        mail.get(trans);
        @(posedge virt_interf.clk);
        //per clock instruction
        
        virt_interf.bitA <= trans.bitA;
        virt_interf.bitB <= trans.bitB;
        virt_interf.sum <= trans.sum;
        @(posedge virt_interf.clk);
        //per clock instruction
        
        transaction_count++;
        end //forever end
        endtask
        
endclass //end of driver
