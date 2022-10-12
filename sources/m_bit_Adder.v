
// This module takes two 4-bit inputs and a carry and outputs
// the arithmetic sum of the three, along with a carry out.

// Originally designed in logic designer program.

// Constructed out of four full adders.

module m_bit_Adder(
    input [3:0] A,
    input [3:0] B,
	input carry_in,
    output [3:0] SUM,
	output carry_out
);

wire X2, X4, X5, X6, X46, X50, X52, X53, X68, X74, X78, X80, X81, X91, X95, X99, X101, X112;


xor U2 (X2,A[0], B[0]);

xor U3 (SUM[0],X2, carry_in);

and U4 (X4,X2, carry_in);

and U5 (X5,B[0], A[0]);

or U6 (X6,X4, X5);

xor U46 (X46,B[1], A[1]);

xor U48 (SUM[1],X46, X68);

and U50 (X50,X46, X68);

and U52 (X52,B[1], A[1]);

or U53 (X53,X50, X52);

buf U68 (X68,X6);

xor U74 (X74,B[2], A[2]);

xor U76 (SUM[2],X74, X91);

and U78 (X78,X74, X91);

and U80 (X80,B[2], A[2]);

or U81 (X81,X78, X80);

buf U91 (X91,X53);

xor U95 (X95,B[3], A[3]);

xor U97 (SUM[3],X95, X112);

and U99 (X99,X95, X112);

and U101 (X101,B[3], A[3]);

or U102 (carry_out,X99, X101);

buf U112 (X112,X81);

endmodule
