`timescale 1ns / 1ps

module Opcode_Generator(
    input clk,
    input b_up_add_out,
    input b_left_subtract_out,
    input b_right_multiply_out,
    input b_down_square_out,
    output [1:0] opcode_out
    );
        
wire [1:0] opcode;
wire add_press;
wire subtract_press;
wire multiply_press;
wire square_press;

wire any_button_press;
or any_button_press_gate (any_button_press, b_up_add_out, b_mid_select_out, b_left_subtract_out, b_right_multiply_out, b_down_square_out);

// Flip-flops to remember what the last button pressed was
dff_en adder_pressed (
    .data_out(add_press),
    .in_D ( b_up_add_out ),
    .in_CLK ( clk ),
    .in_EN( any_button_press )
    );
    
dff_en subtractor_pressed (
    .data_out(subtract_press),
    .in_D ( b_left_subtract_out ),
    .in_CLK ( clk ),
    .in_EN( any_button_press )
    );

dff_en multiplier_pressed (
    .data_out(multiply_press),
    .in_D ( b_right_multiply_out ),
    .in_CLK ( clk ),
    .in_EN( any_button_press )
    );
    
dff_en squarer_pressed (
    .data_out(square_press),
    .in_D ( b_down_square_out ),
    .in_CLK ( clk ),
    .in_EN( any_button_press )
    );

// Two muxes that select the opcode based on the state of the 4 buttons
mux #(16,1) opcode_selector1 (
	.data_out(opcode[0]),
	.select_in( {add_press, subtract_press, multiply_press, square_press} ),
	.data_in( {1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0} )
);

mux #(16,1) opcode_selector2 (
	.data_out(opcode[1]),
	.select_in( {add_press, subtract_press, multiply_press, square_press} ),
	.data_in( {1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0} )
);

assign opcode_out = opcode;

endmodule
