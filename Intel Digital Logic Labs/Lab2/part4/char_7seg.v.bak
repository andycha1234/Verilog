// implements a 7-segment decoder for d, E, 1 and 0
module char_7seg (C, segment);
input [3:0] C; // input code
output [0:6] segment; // output 7-seg code

//boolean expression from truth table and K-map 
assign segment[0] = (~C[3]&C[2]&~C[1]&~C[0]) | (~C[3]&~C[2]&~C[1]&C[0]);
assign segment[1] = (~C[3]&C[2]&~C[1]&C[0]) | (~C[3]&C[2]&C[1]&~C[0]);
assign segment[2] = (~C[3]&~C[2]&C[1]&~C[0]);
assign segment[3] = (~C[3]&C[2]&~C[1]&~C[0]) | (~C[2]&~C[1]&C[0]) | (~C[3]&C[2]&C[1]&C[0]);
assign segment[4] = (~C[3]&C[0]) | (~C[3]&C[2]&~C[1]) | (~C[2]&~C[1]&C[0]);
assign segment[5] = (~C[3]&~C[2]&C[0]) | (~C[3]&~C[2]&C[1]) | (~C[3]&C[1]&C[0]);
assign segment[6] = (~C[3]&~C[2]&~C[1]) | (~C[3]&C[2]&C[1]&C[0]);


endmodule