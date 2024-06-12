module part4 (clk, SW, KEY, LEDR);
input clk;
input [2:0] SW;
//KEY[1] display morse code 
//KEY[0] asynchronous reset
input [1:0] KEY;

output [9:0] LEDR;

//button wire
wire display;
wire reset;
wire [2:0] letter;

//module wire
wire [2:0] size;
wire [26:0] count_sec;
wire [24:0] count_half_sec;
wire En_half_sec;
wire logic_en, load_logic_size, load_logic_shift;
wire  [3:0] morse_code, shifted_morse_code;
wire dot;
wire Q;
wire roll;

assign display = KEY[1];
assign reset = KEY[0];
assign letter = SW[2:0];

assign LEDR[0] = Q;
assign LEDR[6:1] = 0;
assign LEDR[7] = roll;
assign LEDR[8] = reset;
assign LEDR[9] = display;

freq_counter_half_sec U0 ( .Clock(clk), .counter(count_half_sec) );
nor_gate U1 ( .counter(count_half_sec), .E(En_half_sec) );

letter_selection_logic U4 ( .select(letter), .data(morse_code) );

letter_size_register U5 ( .select(letter), .load(logic_en), .enable(load_logic_size), .reset(reset), .size(size) );

letter_symbols_shift_register U6 ( .data(morse_code), .load(logic_en), .enable(load_logic_shift), .reset(reset), .size(size), .symbol(shifted_morse_code) );

two_bit_counter U7 ( .data(shifted_morse_code), .size(size), .Clock(clk), .reset(reset), .E(logic_en), .en_clk(En_half_sec), .Q(dot), .rollover(roll) );

logic U8 ( .Clock(clk), .display(display), .E_size(load_logic_size), .E_shift(load_logic_shift), .dot(dot), .reset(reset), .enable(logic_en), .Q(Q), .rollover(roll) );

endmodule