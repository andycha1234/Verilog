module comparator(v, z);
input [5:0] v;

output [2:0] z;

//boolean expression from truth table and K-map 
assign z[2] = (v[5]&v[3]) | (v[5]&v[4]);
assign z[1] = (~v[5]&v[4]&v[2]) | (~v[5]&v[4]&v[3]) | (v[4]&v[3]&v[2]) | (v[5]&~v[4]&~v[3]);
assign z[0] = (v[5]&~v[4]&~v[3]) | (v[5]&~v[3]&v[1])| (v[5]&~v[3]&v[2]) | (~v[5]&~v[4]&v[3]&v[1]) | (~v[5]&~v[4]&v[3]&v[2]) | (~v[5]&v[4]&~v[3]&~v[2]) | (v[5]&v[4]&v[3]&~v[2]);

endmodule