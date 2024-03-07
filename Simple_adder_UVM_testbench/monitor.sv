class fa_monitor extends uvm_monitor;
  
  //[Recommended] Makes this driver more re-usable
  `uvm_component_utils(fa_monitor)
  
  //Actual interface object is later obtained by doing a get( ) call on uvm_config_db
  virtual fa_interface vif;
  
  //Instantiate sequence item we are going to use
  fa_sequence_item item;
  
  //sequence_item is a custom class object used to encapsulate signal information and can
  //be sent to other components
  uvm_analysis_port #(fa_sequence_item) monitor_port;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_monitor", uvm_component parent = null);
    super.new(name, parent);
    
    //Construct monitor and scoreboard port
    monitor_port = new("monitor_port", this); 
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    //Get virtual interface handle from the configuration database
    if(!(uvm_config_db #(virtual fa_interface)::get(this, "", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS" , "DUT interface not found")
    end
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
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
    forever begin
      
      //Create sequence item
      item = fa_sequence_item::type_id::create("item");
      
      //Sample the inputs (only when reset = 0)
      wait(!vif.reset);
      //Only sample when positive clock (blocking)
      @(posedge vif.clock);
      item.a = vif.a;
      item.b = vif.b;
      item.cin = vif.cin;
      
      //Sample the outputs (DUT: send input on current cycle, give output on next cycle)
      @(posedge vif.clock);
      item.sum = vif.sum;
      item.cout = vif.cout;
      
      //send item to scoreboard
      monitor_port.write(item);
    end   
  endtask
  
endclass