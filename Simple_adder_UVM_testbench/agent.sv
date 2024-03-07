class fa_agent extends uvm_agent;
  
  //[Recommended] Make this agent more re-usable
  `uvm_component_utils(fa_agent)
  
  //Instantiation - Container for driver, monitor, and sequencer
  fa_driver drv;
  fa_monitor mon;
  fa_sequencer seqr;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    //create agent component and "this" signifies that THIS class is parent or "test" is parent class
    drv = fa_driver::type_id::create("drv", this);
    mon = fa_monitor::type_id::create("mon", this);
    seqr = fa_sequencer::type_id::create("seqr", this);
  endfunction
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    //Connect driver and sequencer port to exchange transaction
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  //not a function. Run phase is a task because it can consume time or contain time consuming statements
  //functions cannot contain any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    //logic 
    
  endtask
  
endclass