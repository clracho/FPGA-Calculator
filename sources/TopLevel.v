`timescale 1ns / 1ps

module TopLevel(
    input clk,
    input [15:0] bit_input,
    input b_up_add,
    input b_left_subtract,
    input b_right_multiply,
    input b_down_square,
    input b_mid_select,
    output dp_out,
    output [3:0] anode,
    output CA,CB,CC,CD,CE,CF,CG,
    output [15:0] led
    );
    
wire [31:0] operation_output;

// Assign LEDs to switches
assign led = bit_input;

// Debouncers for each of the 5 buttons
PushButton_Debouncer addition_debouncer(
    .clk(clk),
    .PB(b_up_add),
    .PB_up(b_up_add_out)
    );
    
PushButton_Debouncer subtraction_debouncer(
    .clk(clk),
    .PB(b_left_subtract),
    .PB_up(b_left_subtract_out)
    );

PushButton_Debouncer multiplication_debouncer(
    .clk(clk),
    .PB(b_right_multiply),
    .PB_up(b_right_multiply_out)
    );
    
PushButton_Debouncer squaring_debouncer(
    .clk(clk),
    .PB(b_down_square),
    .PB_up(b_down_square_out)
    );

PushButton_Debouncer select_debouncer(
    .clk(clk),
    .PB(b_mid_select),
    .PB_up(b_mid_select_out)
    );

// Buses to store inputs
wire [15:0] input1;
wire [15:0] input2;

// Module that stores input1 and input2 as well as the "display_state"
// that indicates what the display should be reading.
Store_Inputs_and_Display_State Store_Inputs_and_Display_State1(
    .bit_input(bit_input),
    .clk(clk),
    .b_up_add_out(b_up_add_out),
    .b_left_subtract_out(b_left_subtract_out),
    .b_right_multiply_out(b_right_multiply_out),
    .b_down_square_out(b_down_square_out),
    .b_mid_select_out(b_mid_select_out),
    .input1(input1),
    .input2(input2),
    .operation_state(operation_state)
    );

// 32-bit buses for operation module outputs
wire [31:0] subtractor_output;
wire [31:0] adder_output;
wire [31:0] multiplier_output;
wire [31:0] squarer_output;
wire is_negative;

// Operation Modules
Subtractor Subtractor1(
    .subtractor_input1(input1),
    .subtractor_input2(input2),
    .subtractor_output(subtractor_output),
    .negative_number( is_negative )
    );

Adder Adder1(
    .adder_input1(input1),
    .adder_input2(input2),
    .adder_output(adder_output)
    );

Multiplier Multiplier1(
    .A(input1),
    .B(input2),
    .multiply_output(multiplier_output)
    );

Multiplier Squarer1(
    .A(input1),
    .B(input1),
    .multiply_output(squarer_output)
    );

// Module to create opcode for mux
wire [1:0] opcode;

Opcode_Generator Opcode_Generator1(
    .clk( clk ),
    .b_up_add_out( b_up_add_out ),
    .b_left_subtract_out( b_left_subtract_out ),
    .b_right_multiply_out( b_right_multiply_out ),
    .b_down_square_out( b_down_square_out ),
    .opcode_out(opcode)
    );

mux4b #(32) operator_output_selector (
	.out(operation_output),
	.sel( {opcode} ),
	.in0( adder_output ),
	.in1( multiplier_output),
	.in2( subtractor_output),
	.in3( squarer_output)
    );
    
// Only want to display the negative symbol if subtract button is pressed
wire is_negative_and_subtract;
wire opcode_0_inverted;
not invert_opcode_0(opcode_0_inverted, opcode[0]);
and is_negative_and_subtract_gate(is_negative_and_subtract,is_negative,opcode_0_inverted,opcode[1]);
    
// Wire to store the data to be sent to 7-segment display driver.
// 20 bits long because we have 5 bits corresponding to each of the
// 4 character displays.
wire [19:0] operation_output_20b;
wire display_divider_dp_out;

// This module converts the 32-bit output from operation module
// to 4 5-bit segments that appear to "move" visually left-to-right.
Display_Mover Display_Mover1(
    .input_to_display(operation_output),
    .clk( clk ),
    .is_negative(is_negative_and_subtract),
    .input_to_display_20b(operation_output_20b),
    .dp_out( display_divider_dp_out)
    );
    
// More buses to handle 20 bits for display.    
wire [19:0] final_output;
wire [19:0] display_value_1;

// Needed to convert our 16-bit input from switches to 20-bit output
// for display.
assign display_value_1 = {1'b0,bit_input[15:12],1'b0,bit_input[11:8],1'b0,bit_input[7:4],1'b0,bit_input[3:0]};

// Mux to choose between displaying what is currently being input and
// output from chosen operator.
mux4b #(20) final_output_selector (
	.out(final_output),
	.sel( {1'b0, operation_state} ),
	.in0( display_value_1 ),
	.in1( operation_output_20b),
	.in2( operation_output_20b),
	.in3( operation_output_20b)
    );
    
// Enables decimal-point whenever we are displaying an output.    
wire rightmost_dp;
and right_most_dp_gate(rightmost_dp, operation_state, display_divider_dp_out);

// Break down 20-bit bus into 4 different 5-bit buses for display.
wire [4:0] rightmost;
wire [4:0] right_center;
wire [4:0] left_center;
wire [4:0] leftmost;

assign rightmost = final_output[4:0];
assign right_center = final_output[9:5];
assign left_center = final_output[14:10];
assign leftmost = final_output[19:15];

// Given 7-segment display module that displays 4 different numbers/characters.
wire [4:0] data_out;

sseg_mux sseg_mux1(
    .clk(clk),
    .leftmost({leftmost}),
    .left_center(left_center),
    .right_center({right_center}),
    .rightmost({rightmost}),
    .leftmost_dp(leftmost_dp),
    .left_center_dp(left_center_dp),
    .right_center_dp(right_center_dp),
    .rightmost_dp(rightmost_dp),
    .data_out(data_out),
    .dp_out(dp_out),
    .anode(anode)
    );

// Driver that takes 5-bit output from sseg_mux and converts it
// into 7 outputs for seven segment display.
Seven_Segment_Display_Driver Seven_Segment_Display_Driver1(
    .V(data_out[4]),
    .W(data_out[3]),
    .X(data_out[2]),
    .Y(data_out[1]),
    .Z(data_out[0]),
    .CA(CA),
    .CB(CB),
    .CC(CC),
    .CD(CD),
    .CE(CE),
    .CF(CF),
    .CG(CG)
    );

endmodule
