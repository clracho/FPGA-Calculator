`timescale 1ns / 1ps

module Store_Inputs_and_Display_State(
    input [15:0] bit_input,
    input clk,
    input b_up_add_out,
    input b_left_subtract_out,
    input b_right_multiply_out,
    input b_down_square_out,
    input b_mid_select_out,
    output [15:0] input1,
    output [15:0] input2,
    output operation_state
    );
    
// Store the first input when select button pressed
dff_en input1_holder (
	.data_out(input1),
	.in_D( bit_input ),
	.in_CLK( clk ),
	.in_EN( b_mid_select_out )
    );

// Store the second input whenever an operation button is pressed
wire any_operation_button_wire;
or any_operation_button_gate(any_operation_button_wire, b_up_add_out, b_left_subtract_out, b_right_multiply_out, b_down_square_out);

dff_en input2_holder (
    .data_out(input2),
    .in_D (bit_input),
    .in_CLK( clk ),
    .in_EN(any_operation_button_wire)
    );
    
// Have a flip-flop to store the value that corresponds to what state the display should be in.
wire any_button_press;
or any_button_press_gate (any_button_press, b_up_add_out, b_mid_select_out, b_left_subtract_out, b_right_multiply_out, b_down_square_out);

dff_en operation_display (
    .data_out(operation_state),
    .in_D ( any_operation_button_wire ),
    .in_CLK ( clk ),
    .in_EN( any_button_press )
    );
    
endmodule
