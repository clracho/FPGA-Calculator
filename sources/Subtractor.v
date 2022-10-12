`timescale 1ns / 1ps

module Subtractor(
    input [15:0] subtractor_input1,
    input [15:0] subtractor_input2,
    output [31:0] subtractor_output,
    output negative_number
    );

    // Buses to connect 4-bit adder modules.
    wire [3:0] SUM1;
    wire [3:0] SUM2;
    wire [3:0] SUM3;
    wire [3:0] SUM4;
    wire carry_out1;
    wire carry_out2;
    wire carry_out3;
    wire carry_out4;
 
    // Invert the second input for subtraction.
    wire [15:0] inverted_input2;
    Inverter_16_bit Inverter_16_bit1(
        .inverter_input(subtractor_input2),
        .inverter_output(inverted_input2)
        );
    
    wire [31:0] adder_output;
    
    // Increment second input by 1.
    Adder add_1_to_inverted_input(
        .adder_input1(inverted_input2),
        .adder_input2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .adder_output(adder_output)
        );
    
    wire [15:0] inverted_input2_plus1;
    assign inverted_input2_plus1 = adder_output[15:0];
    
    // 4 4-bit Adders to Handle 16 bits.
    m_bit_Adder m_bit_Adder1(
        .A(subtractor_input1[3:0]),
        .B(inverted_input2_plus1[3:0]),
        .carry_in(1'b0),
        .SUM(SUM1),
        .carry_out(carry_out1)
        );
        
    m_bit_Adder m_bit_Adder2(
        .A(subtractor_input1[7:4]),
        .B(inverted_input2_plus1[7:4]),
        .carry_in(carry_out1),
        .SUM(SUM2),
        .carry_out(carry_out2)
        );
     
    m_bit_Adder m_bit_Adder3(
        .A(subtractor_input1[11:8]),
        .B(inverted_input2_plus1[11:8]),
        .carry_in(carry_out2),
        .SUM(SUM3),
        .carry_out(carry_out3)
        );
    
    m_bit_Adder m_bit_Adder4(
        .A(subtractor_input1[15:12]),
        .B(inverted_input2_plus1[15:12]),
        .carry_in(carry_out3),
        .SUM(SUM4),
        .carry_out(carry_out4)
        );
    
    // Need to decrement by 1 (by adding 11111111111111) and then inverting
    // to handle negative numbers.
    wire [31:0] decrement_by_1_output;
    
    Adder decrement_by_1(
        .adder_input1({SUM4, SUM3, SUM2, SUM1}),
        .adder_input2({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .adder_output(decrement_by_1_output)
        );
        
    wire [15:0] decrement_by_1_inverted;
    Inverter_16_bit Inverter_16_bit2(
        .inverter_input(decrement_by_1_output[15:0]),
        .inverter_output(decrement_by_1_inverted)
        );
    
    wire [15:0] final_output;
    
    wire is_positive;
    
    // Or gate to determine if output is negative.
    or is_positive_gate(is_positive, carry_out4, adder_output[16]);

    not negate_is_positive_gate(negative_number, is_positive);
    
    // Mux to select between negative and positive output.
    mux4b #(16) final_output_selector (
        .out(final_output),
        .sel( {1'b0, is_positive} ),
        .in0( decrement_by_1_inverted ),
        .in1( {SUM4, SUM3, SUM2, SUM1} ),
        .in2( {SUM4, SUM3, SUM2, SUM1} ),
        .in3( {SUM4, SUM3, SUM2, SUM1} )
        );
    
    // Finalized output
    assign subtractor_output = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,final_output};

endmodule
