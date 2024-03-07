class fa_sequencer extends uvm_sequencer#(fa_sequence_item);
  
  //[Recommended] Makes this test more re-usable
  `uvm_component_utils(fa_sequencer)
  
  //--------------------------------------------------------
  //Constructor - Standard Code for all components
  //--------------------------------------------------------
  function new (string name = "fa_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  //not a function. Run phase is a task because it can consume time or contain time consuming statements
  //functions cannot contain any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass