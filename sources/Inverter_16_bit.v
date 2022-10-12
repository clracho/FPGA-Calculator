`timescale 1ns / 1ps

module Inverter_16_bit(
    input [15:0] inverter_input,
    output [15:0] inverter_output
    );
    
    not inverter0(inverter_output[0], inverter_input[0]);
    not inverter1(inverter_output[1], inverter_input[1]);
    not inverter2(inverter_output[2], inverter_input[2]);
    not inverter3(inverter_output[3], inverter_input[3]);
    not inverter4(inverter_output[4], inverter_input[4]);
    not inverter5(inverter_output[5], inverter_input[5]);
    not inverter6(inverter_output[6], inverter_input[6]);
    not inverter7(inverter_output[7], inverter_input[7]);
    not inverter8(inverter_output[8], inverter_input[8]);
    not inverter9(inverter_output[9], inverter_input[9]);
    not inverter10(inverter_output[10], inverter_input[10]);
    not inverter11(inverter_output[11], inverter_input[11]);
    not inverter12(inverter_output[12], inverter_input[12]);
    not inverter13(inverter_output[13], inverter_input[13]);
    not inverter14(inverter_output[14], inverter_input[14]);
    not inverter15(inverter_output[15], inverter_input[15]);
    
endmodule
