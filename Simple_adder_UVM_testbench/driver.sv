class fa_driver extends uvm_driver#(fa_sequence_item);
  
  //[Recommended] Makes this driver more re-usable
  `uvm_component_utils(fa_driver)
  
  //Instantiate interface handle
  virtual fa_interface vif;
  
  //Instantiate sequence item we are going to use
  fa_sequence_item item;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    //Get virtual interface
    if(!(uvm_config_db #(virtual fa_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get vif from config DB")
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
    
    //Drives the logic we want to simulate the DUT (driver -> interface)
    forever begin
      //create sequence item
      item = fa_sequence_item::type_id::create("item"); 
      //get port from agent.sv to get sequences from sequencer
      seq_item_port.get_next_item(item);
      //logic (we will make as a task for plug and play
      drive(item);
      //Indicate we are done driving the item and ready for the next item
      seq_item_port.item_done();
    end
    
  endtask
  
  //--------------------------------------------------------
  //Drive
  //--------------------------------------------------------
  task drive(fa_sequence_item item);
    //Drive only on positive clock (grab clock from interface)
    @(posedge vif.clock);
    //drive packet 'item' inputs to interface (nonblocking)
    vif.reset <= item.reset;
    vif.a <= item.a;
    vif.b <= item.b;
    vif.cin <= item.cin;
  endtask

endclass