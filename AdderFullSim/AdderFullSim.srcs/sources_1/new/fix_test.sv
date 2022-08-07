//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ying    
// Create Date: 06/10/2021 10:10:17 PM
// Design Name: Ying Zhu
//////////////////////////////////////////////////////////////////////////////////
`include "Environment.sv"
`include "Transaction.sv"

program fix_test(interf interf);    
    bit [1:0] count;
    
    function void randomize();
        bitA.rand_mode(0);
        bitB.rand_mode(0);
        
 //       bitA = 2;
   //     bitB = 13;
        
     endfunction




endprogram
