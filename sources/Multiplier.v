`timescale 1ns / 1ps

// This module works by using 16 16-bit Adders to "multiply"
// every bit of A by every bit of B and add the sum for a
// 32-bit output.

module Multiplier(
    input [15:0] A,
    input [15:0] B,
    output [31:0] multiply_output

    );
wire [15:0]product1;
wire [15:0]product2;
wire [15:0]product3;
wire [15:0]product4;
wire [15:0]product5;
wire [15:0]product6; 
wire [15:0]product7; 
wire [15:0]product8; 
wire [15:0]product9;
wire [15:0]product10; 
wire [15:0]product11; 
wire [15:0]product12; 
wire [15:0]product13;      
wire [15:0]product14;       
wire [15:0]product15;       
wire [15:0]product16;       
wire [15:0]product17;       
wire [15:0]product18;       
wire [15:0]product19;       
wire [15:0]product20;       
wire [15:0]product21;       
wire [15:0]product22;      
wire [15:0]product23;      
wire [15:0]product24;
wire [15:0]product25;
wire [15:0]product26; 
wire [15:0]product27; 
wire [15:0]product28; 
wire [15:0]product29;
wire [15:0]product30; 
wire [15:0]product31; 
wire [15:0]product32; 
wire [15:0]product33; 
wire [15:0]product34; 
wire [15:0]productbus;

wire [31:0] adder1_result;
wire [31:0] adder2_result;
wire [31:0] adder3_result;
wire [31:0] adder4_result;
wire [31:0] adder5_result;
wire [31:0] adder6_result;
wire [31:0] adder7_result;
wire [31:0] adder8_result;
wire [31:0] adder9_result;
wire [31:0] adder10_result;
wire [31:0] adder11_result;
wire [31:0] adder12_result;
wire [31:0] adder13_result;
wire [31:0] adder14_result;
wire [31:0] adder15_result;
wire [31:0] adder16_result;


 
andmultiply andmultiply_1(
        .A(A[15:0]),
        .B(B[0]),
        .product1(product1)
        );
andmultiply andmultiply_2(    
       .A(A[15:0]),           
       .B(B[1]),                          
       .product1(product2)    
       );              
       
assign multiply_output[0] = product1[0];
assign productbus = {1'b0,product1[15:1]};

Adder Adder1(
        .adder_input1(productbus),
        .adder_input2(product2),
        .adder_output(adder1_result)
        );
assign multiply_output[1] = adder1_result[0];
andmultiply andmultiply_3(
       .A(A[15:0]),       
       .B(B[2]),          
       .product1(product3)
       );
Adder Adder2(                       
        .adder_input1(adder1_result[16:1]),  
        .adder_input2(product3),                               
        .adder_output(adder2_result)          
        );  
assign multiply_output[2] = adder2_result[0];
andmultiply andmultiply_4( 
       .A(A[15:0]),                              
       .B(B[3]),           
       .product1(product4) 
       );  
Adder Adder3(                                     
        .adder_input1(adder2_result[16:1]), 
        .adder_input2(product4),                                          
        .adder_output(adder3_result)       
        );      
assign multiply_output[3] = adder3_result[0];
andmultiply andmultiply_5(                   
       .A(A[15:0]),                          
       .B(B[4]),                             
       .product1(product5)                   
       );                                    
Adder Adder4(                                
        .adder_input1(adder3_result[16:1]),  
        .adder_input2(product5),                                             
        .adder_output(adder4_result)         
        );                                   
assign multiply_output[4] = adder4_result[0];
andmultiply andmultiply_6(                   
       .A(A[15:0]),                          
       .B(B[5]),                             
       .product1(product6)                   
       );                                    
Adder Adder5(                                
        .adder_input1(adder4_result[16:1]),  
        .adder_input2(product6),                                                                         
        .adder_output(adder5_result)         
        );                                   
assign multiply_output[5] = adder5_result[0];
andmultiply andmultiply_7(                    
       .A(A[15:0]),                           
       .B(B[6]),                              
       .product1(product7)                    
       );                                     
Adder Adder6(                                 
        .adder_input1(adder5_result[16:1]),   
        .adder_input2(product7),                                               
        .adder_output(adder6_result)          
        );                                    
assign multiply_output[6] = adder6_result[0]; 

andmultiply andmultiply_8(                   
       .A(A[15:0]),                          
       .B(B[7]),                             
       .product1(product8)                   
       );                                    
Adder Adder7(                                
        .adder_input1(adder6_result[16:1]),  
        .adder_input2(product8),                                             
        .adder_output(adder7_result)         
        );                                   
assign multiply_output[7] = adder7_result[0];
andmultiply andmultiply_9(                   
       .A(A[15:0]),                          
       .B(B[8]),                             
       .product1(product9)                   
       );                                    
Adder Adder8(                                
        .adder_input1(adder7_result[16:1]),  
        .adder_input2(product9),                                             
        .adder_output(adder8_result)         
        );                                   
assign multiply_output[8] = adder8_result[0];
andmultiply andmultiply_10(                   
       .A(A[15:0]),                          
       .B(B[9]),                             
       .product1(product10)                   
       );                                    
Adder Adder9(                                
        .adder_input1(adder8_result[16:1]),  
        .adder_input2(product10),                                             
        .adder_output(adder9_result)         
        );                                   
assign multiply_output[9] = adder9_result[0];
andmultiply andmultiply_11(                   
       .A(A[15:0]),                          
       .B(B[10]),                             
       .product1(product11)                  
       );                                    
Adder Adder10(                                
        .adder_input1(adder9_result[16:1]),  
        .adder_input2(product11),                                           
        .adder_output(adder10_result)         
        );                                   
assign multiply_output[10] = adder10_result[0];
andmultiply andmultiply_12(                    
       .A(A[15:0]),                            
       .B(B[11]),                              
       .product1(product12)                    
       );                                      
Adder Adder11(                                 
        .adder_input1(adder10_result[16:1]),    
        .adder_input2(product12),                                             
        .adder_output(adder11_result)           
        );                                     
assign multiply_output[11] = adder11_result[0];
andmultiply andmultiply_13(                    
       .A(A[15:0]),                            
       .B(B[12]),                              
       .product1(product13)                    
       );                                      
Adder Adder12(                                 
        .adder_input1(adder11_result[16:1]),   
        .adder_input2(product13),                                               
        .adder_output(adder12_result)          
        );                                     
assign multiply_output[12] = adder12_result[0];
andmultiply andmultiply_14(                        
       .A(A[15:0]),                                
       .B(B[13]),                                  
       .product1(product14)                        
       );                                          
Adder Adder13(                                     
        .adder_input1(adder12_result[16:1]),       
        .adder_input2(product14),                                                       
        .adder_output(adder13_result)              
        );                                         
assign multiply_output[13] = adder13_result[0];    
andmultiply andmultiply_15(                        
       .A(A[15:0]),                                
       .B(B[14]),                                  
       .product1(product15)                        
       );                                          
Adder Adder14(                                     
        .adder_input1(adder13_result[16:1]),       
        .adder_input2(product15),                                                        
        .adder_output(adder14_result)              
        );                                         
assign multiply_output[14] = adder14_result[0];
andmultiply andmultiply_16(                      
       .A(A[15:0]),                            
       .B(B[15]),                                  
       .product1(product16)                        
       );                                          
Adder Adder15(                                     
        .adder_input1(adder14_result[16:1]),       
        .adder_input2(product16),                                                       
        .adder_output(adder15_result)              
        );                                         
assign multiply_output[31:15] = adder15_result[16:0];  

endmodule
