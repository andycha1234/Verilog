// Code your design here
module full_adder(
  input clock,
  input reset,
  input [3:0] a,
  input [3:0] b,
  input cin,
  
  output reg [3:0] sum,
  output bit cout
);
  
  reg [3:0] result;
  wire  tmp;
  
  assign result = a ^ b ^ cin;
  assign tmp = ( a & b) | (b & cin) | (a & cin);
  
  always @(posedge clock or posedge reset) begin
    if(reset) begin
      sum  <= 4'd0;
      cout <= 1'd0;
    end
    else begin
      sum <= result;
      cout <= tmp;
    end
  end
  
endmodule