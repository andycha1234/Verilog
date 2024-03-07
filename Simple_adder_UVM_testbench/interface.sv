//adder interface contains all signals that the adder requires
interface fa_interface(input clock);
  //declaring the signals
  logic reset;
  logic [3:0] a;
  logic [3:0] b;
  logic cin;
  logic [3:0] sum;
  bit cout;
endinterface
