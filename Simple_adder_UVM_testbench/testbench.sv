`timescale 1ns/1ns

//Import packages
import uvm_pkg::*;
`include "uvm_macros.svh"

//--------------------------------------------------------
//Included Files
//--------------------------------------------------------
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------

  logic clock;
  
  fa_interface intf(.clock(clock));
  
  full_adder dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .a(intf.a),
    .b(intf.b),
    .cin(intf.cin),
    .sum(intf.sum),
    .cout(intf.cout)
  );
  
  //--------------------------------------------------------
  //Interface Setting
  //--------------------------------------------------------
  initial begin
    uvm_config_db #(virtual fa_interface)::set(null, "*", "vif", intf );
    //-- Refer: https://www.synopsys.com/content/dam/synopsys/services/whitepapers/hierarchical-testbench-configuration-using-uvm.pdf
  end
  
  
  
  //--------------------------------------------------------
  //Start The Test
  //--------------------------------------------------------
  initial begin
    run_test("fa_test");
  end
  
  //--------------------------------------------------------
  //Clock Generation
  //--------------------------------------------------------
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  
  
  //--------------------------------------------------------
  //Maximum Simulation Time
  //--------------------------------------------------------
  initial begin
    #5000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
  
  //--------------------------------------------------------
  //Generate Waveforms
  //--------------------------------------------------------
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule