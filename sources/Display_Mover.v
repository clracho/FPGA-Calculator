`timescale 1ns / 1ps

// The purpose of this module is to display a 32-bit bus on a 16-bit display.

// It module takes a 32-bit input bus and returns a 16-bit bus to be displayed 
// on the 7-segment display. The output 16-bit bus rotates between bits [31:16],
// [27:12], [23:8], [19:4], and [15:0]. This gives the effect of the display
// moving right-to-left displaying the 32-bit number in its entirety in hexadecimal.
// It also uses a decimal point at the end of the number to signal when the number
// has reached the end of the display.

module Display_Mover(
    input [31:0] input_to_display,
    input clk,
    input is_negative,
    output [19:0] input_to_display_20b,
    output dp_out
    );
    
wire [15:0] oop99;
wire [15:0] first_counter_out;
wire [15:0] first_counter_input;

// Because the display needs to move on regular intervals that humans can percieve,
// this module includes a counter that increases by 1 on each clock cycle. When
// the counter reaches an certain number of bits, a different number is output to
// be displayed.

// When adjusted precisely, numbers can be made to appear to move on approximately
// one second intervals.

// It uses two flip-flops with 16-bit buses to store the value that is being incremented.
// Our adder module was also repurposed for incrementing by 1.

Adder first_counter(
    .adder_input1(first_counter_input),
    .adder_input2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
    .adder_output(first_counter_out)
    );
    
dff_en first_16_bits_ff (
    .data_out(oop99),
    .in_D (first_counter_out),
    .in_CLK( clk ),
    .in_EN(1'b1)
    );

assign first_counter_input = oop99;

wire [15:0] second_16_bits;
wire [15:0] second_counter_out;
wire [15:0] out2;
wire all_1s;

// When the first counter has reached a state of being all 1, that is the signal for
// the next counter to increment by 1.

and ALL_ONES_GATE1(all_1s,oop99[15],oop99[14],oop99[13],oop99[12],oop99[11],oop99[10],oop99[9],oop99[8],oop99[7],oop99[6],oop99[5],oop99[4],oop99[3],oop99[2],oop99[1],oop99[0]);

// A second flip-flop and adder is needed because our adder module can only process
// 16-bits at one time, and our counter needs > 16.

dff_en second_16_bits_ff(
    .data_out(out2),
    .in_D (second_counter_out),
    .in_CLK ( clk ),
    .in_EN( all_1s)
    );

assign second_16_bits = out2;

Adder second_counter(
    .adder_input1(second_16_bits),
    .adder_input2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
    .adder_output(second_counter_out)
    );

wire [19:0] final_output_selector1_out;
wire [19:0] final_output_selector2_out;

wire [19:0] first_4_digits;
wire [19:0] second_4_digits;
wire [19:0] third_4_digits;
wire [19:0] fourth_4_digits;
wire [19:0] fifth_4_digits;

assign first_4_digits = {1'b0,input_to_display[15:12],1'b0,input_to_display[11:8],1'b0,input_to_display[7:4],1'b0,input_to_display[3:0]};
assign second_4_digits = {1'b0,input_to_display[19:16],1'b0,input_to_display[15:12],1'b0,input_to_display[11:8],1'b0,input_to_display[7:4]};
assign third_4_digits = {1'b0,input_to_display[23:20],1'b0,input_to_display[19:16],1'b0,input_to_display[15:12],1'b0,input_to_display[11:8]};
assign fourth_4_digits = {1'b0,input_to_display[27:24],1'b0,input_to_display[23:20],1'b0,input_to_display[19:16],1'b0,input_to_display[15:12]};
assign fifth_4_digits = {1'b0,input_to_display[31:28],1'b0,input_to_display[27:24],1'b0,input_to_display[23:20],1'b0,input_to_display[19:16]};

// Mux decides whether or not to include a negative symbol in the output

wire [4:0] negative_or_pos_symbol;
mux4b #(5) negative_symbol_selector (
    .out(negative_or_pos_symbol),
    .sel( {1'b0, is_negative} ),
    .in0({1'b1,1'b1,1'b1,1'b1,1'b1}),
    .in1({1'b1,1'b0,1'b0,1'b0,1'b1}),
    .in2({1'b1,1'b0,1'b0,1'b0,1'b1}),
    .in3({1'b1,1'b0,1'b0,1'b0,1'b1})
    );

// Three muxes are used to select between different values to output. We use the 10th, 11th,
// and 12th bits of our counter as a select.

mux4b #(20) final_output_selector1 (
	.out(final_output_selector1_out),
	.sel( {out2[11], out2[10]} ),
	.in0( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,negative_or_pos_symbol,fifth_4_digits[19:15]}),
	.in1( {1'b1,1'b1,1'b1,1'b1,1'b1,negative_or_pos_symbol,fifth_4_digits[19:10]} ),
	.in2( {negative_or_pos_symbol,fifth_4_digits[19:5]} ),
	.in3( fifth_4_digits )
    );

mux4b #(20) final_output_selector2 (
	.out(final_output_selector2_out),
	.sel( {out2[11], out2[10]} ),
	.in0( fourth_4_digits ),
	.in1( third_4_digits ),
	.in2( second_4_digits ),
	.in3( first_4_digits )
    );
    
mux4b #(20) final_output_selector3 (
    .out(input_to_display_20b),
    .sel( {1'b0, out2[12]}),
    .in0(final_output_selector1_out),
    .in1(final_output_selector2_out),
    .in2(final_output_selector2_out),
    .in3(final_output_selector2_out)
    );
    
// This mux outputs a "1" if we want our decimal point to light up. We want this to happen
// when the least significant 16-bits are being displayed.
    
mux #(8,1) dp_output_selector (
    .data_out(dp_out),
    .select_in( {out2[12], out2[11], out2[10]}),
    .data_in( {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0})
    );
    
endmodule
