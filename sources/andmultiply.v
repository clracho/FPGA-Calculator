`timescale 1ns / 1ps

// This module takes a 16-bit input A and a single-bit input B and outputs
// B "anded" with every bit of A.
// So the output looks like {A[15]*B,A[14]*B,A[13]*B,A[12]*B,...A[0]*B}

module andmultiply(
input B,
input [15:0]A,
output [15:0]product1
);
and U7 (product1[0],A[0],B);  
and U9 (product1[1],A[1],B);  
and U10 (product1[2],A[2],B); 
and U11 (product1[3],A[3],B); 
and U12 (product1[4],A[4],B); 
and U13 (product1[5],A[5],B); 
and U14 (product1[6],A[6],B); 
and U15 (product1[7],A[7],B); 
and U16 (product1[8],A[8],B); 
and U17 (product1[9],A[9],B);
and U18 (product1[10],A[10],B);
and U19 (product1[11],A[11],B);
and U20 (product1[12],A[12],B);
and U21 (product1[13],A[13],B);
and U22 (product1[14],A[14],B);
and U23 (product1[15],A[15],B);


endmodule
