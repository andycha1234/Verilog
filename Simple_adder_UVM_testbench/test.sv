class fa_test extends uvm_test;
  
  //[Recommended] Makes this test more re-usable
  `uvm_component_utils(fa_test)
  
  //instantiation - Container for env
  //create env handle 
  fa_env env;
  //create sequence handles (we have two)
  fa_sequence pkt;
  fa_rst_sequence rst_pkt;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    //create env component and "this" signifies that THIS class is parent or "test" is parent class
    env = fa_env::type_id::create("env", this);
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
   
    //Raise Objection - else this test will not consume simulation  time
    phase.raise_objection(this);
    
    //Start reset packet first
    rst_pkt = fa_rst_sequence::type_id::create("rst_pkt");
    //start sequence from path: env -> agent -> sequence (there can be many environment, agents, sequence
    //specify which one
    rst_pkt.start(env.agnt.seqr);
    #10;
    
    repeat(100) begin
      //Create and Instantiate the sequence
      pkt = fa_sequence::type_id::create("pkt");

      //Start the sequence on a given sequencer
      pkt.start(env.agnt.seqr);
      #5;
    end
    
    //Drops Objection - else this test will not finish
    phase.drop_objection(this);
    
  endtask
  
endclass