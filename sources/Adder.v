`timescale 1ns / 1ps

module Adder(
    input [15:0] adder_input1,
    input [15:0] adder_input2,
    output [31:0] adder_output
    );
    
    wire [3:0] SUM1;
    wire [3:0] SUM2;
    wire [3:0] SUM3;
    wire [3:0] SUM4;
    wire carry_out1;
    wire carry_out2;
    wire carry_out3;
    wire carry_out4;
    
    m_bit_Adder m_bit_Adder1(
        .A(adder_input1[3:0]),
        .B(adder_input2[3:0]),
        .carry_in(1'b0),
        .SUM(SUM1),
        .carry_out(carry_out1)
        );
        
    m_bit_Adder m_bit_Adder2(
        .A(adder_input1[7:4]),
        .B(adder_input2[7:4]),
        .carry_in(carry_out1),
        .SUM(SUM2),
        .carry_out(carry_out2)
        );
     
    m_bit_Adder m_bit_Adder3(
        .A(adder_input1[11:8]),
        .B(adder_input2[11:8]),
        .carry_in(carry_out2),
        .SUM(SUM3),
        .carry_out(carry_out3)
        );
    
    m_bit_Adder m_bit_Adder4(
        .A(adder_input1[15:12]),
        .B(adder_input2[15:12]),
        .carry_in(carry_out3),
        .SUM(SUM4),
        .carry_out(carry_out4)
        );
    
    assign adder_output[31:0] = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,carry_out4,SUM4, SUM3, SUM2, SUM1};
    //assign adder_output[15:0] = {1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
    
    
endmodule
