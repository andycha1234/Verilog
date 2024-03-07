//Object class and not component class
class fa_sequence_item extends uvm_sequence_item;
  
  //[Recommended] Makes this test more re-usable
  `uvm_object_utils(fa_sequence_item)
  
  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------
  //generate random input values and store output result
  rand logic reset;
  rand logic [3:0] a, b;
  rand logic cin;
  
  //Outputs. We don't randomize outputs
  logic [3:0] sum;
  bit cout;
  
  //--------------------------------------------------------
  //Add Constraints Here if needed (based on specs)
  //--------------------------------------------------------
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fa_sequence_item");
    super.new(name);
  endfunction
  
endclass