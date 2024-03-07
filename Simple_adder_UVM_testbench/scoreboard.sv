//Driver drives transactions one by one on the interface
//Monitor will sample those inputs 
//Scoreboard will compare if the results are what we expect vs. the result from the DUT

class fa_scoreboard extends uvm_test;
  
  //[Recommended] Makes this driver more re-usable
  `uvm_component_utils(fa_scoreboard)
  
  //Declare and Create a TLM ANalysis Port to receive data objects from other TB Components
  uvm_analysis_imp #(fa_sequence_item, fa_scoreboard) scoreboard_port;
  
  //create queue to hold transactions 
  fa_sequence_item transactions[$];
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    //instantiate the analysis port because its a class object
    scoreboard_port = new("scoreboard_port", this);
  endfunction
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
  
  //--------------------------------------------------------
  //Write Method
  //--------------------------------------------------------
  //Define Action to be taken when a packet is received via the declared analysis port 
  function void write(fa_sequence_item item);
    //storing item to queue 
    transactions.push_back(item);
  endfunction
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  //not a function. Run phase is a task because it can consume time or contain time consuming statements
  //functions cannot contain any time consuming statements
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    forever begin
      //Order of Operation:
      //1. get the packet
      //2. generate expected values
      //3. compare to actual values from DUT
      //4. score the transactions accordingly
      
      //variable to get the first transaction (FIFO)
      fa_sequence_item curr_trans;
      //wait until there is element in queue
      wait(transactions.size() != 0);
      //grabs first element in queue (front)
      curr_trans = transactions.pop_front();
      //Create and call task to compare expected values and DUT values 
      compare(curr_trans);    
    end
  endtask
  
  //Generate expected result and compare with actual
  task compare(fa_sequence_item curr_trans);
    logic [3:0] expected_sum;
    logic [3:0] expected_cout;
    logic [3:0] actual_sum;
    logic [3:0] actual_cout;
    
    //Generate expected values based on specification of DUT
    expected_sum = curr_trans.a ^ curr_trans.b ^ curr_trans.cin;
    expected_cout = (curr_trans.a & curr_trans.b) | (curr_trans.cin & (curr_trans.a ^ curr_trans.b));
    
    //Get actual value from DUT (what we sampled from monitor)
    actual_sum = curr_trans.sum;
    actual_cout = curr_trans.cout;
    
    //Compare results
    if(actual_sum != expected_sum) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! actual_sum = %d, expected_sum = %d", actual_sum, expected_sum));
    end
    else if (actual_cout != expected_cout) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! actual_cout = %d, expected_cout = %d", actual_cout, expected_cout));
    end
    else begin
      //3 arguments - UVM_LOW (verbosity - prints regardless)
      `uvm_info("COMPARE", $sformatf("Transaction Passed! actual_sum = %d, actual_cout = %d, expected_sum = %d, expected_cout = %d", actual_sum, actual_cout, expected_sum, expected_cout), UVM_LOW);
    end
    
  endtask
  
endclass