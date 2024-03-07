class fa_env extends uvm_env;
  
  //[Recommended] Makes this env more re-usable
  `uvm_component_utils(fa_env)
  
  //Instantiation - container for agent
  //create agent handle
  fa_agent agnt;
  //create scoreboard handle
  fa_scoreboard scb;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agnt = fa_agent::type_id::create("agnt", this);
    scb = fa_scoreboard::type_id::create("scb", this);
  endfunction
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //Connect agent monitor port to scoreboard port
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
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