//Object Class
class fa_sequence extends uvm_sequence;
  
  //[Recommended] Makes this test more re-usable
  `uvm_object_utils(fa_sequence)
  
  //Instantiate sequence item 
  fa_sequence_item pkt;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_sequence");
    super.new(name);
  endfunction
  
  //--------------------------------------------------------
  //Body - Operations on sequence
  //--------------------------------------------------------
  task body();
    
    //create packet 
    pkt = fa_sequence_item::type_id::create("pkt");
    //get permission from sequencer to start sequence in driver
    start_item(pkt);
    //drive random values with constraint reset = 0. DUT will not reset
    pkt.randomize() with {reset == 0;};
    finish_item(pkt);
  endtask
  
endclass

//inherits everything from above class (packet)
class fa_rst_sequence extends fa_sequence;
  
  //[Recommended] Makes this test more re-usable
  `uvm_object_utils(fa_rst_sequence)
  
  //Instantiate sequence item 
  fa_sequence_item rst_pkt;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_rst_sequence");
    super.new(name);
  endfunction
  
  //--------------------------------------------------------
  //Body - Operations on sequence
  //--------------------------------------------------------
  task body();
    
    //create packet 
    rst_pkt = fa_sequence_item::type_id::create("rst_pkt");
    //get permission from sequencer to start sequence in driver
    start_item(rst_pkt);
    //drive random values with constraint reset = 0. DUT will not reset
    rst_pkt.randomize() with {reset == 1;};
    finish_item(rst_pkt);
  endtask
  
endclass