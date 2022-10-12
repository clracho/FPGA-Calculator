// Modified to handle 16 bits

module dff_en(
	input [15:0] in_D, in_EN, in_CLK,
	output reg [15:0] data_out
	);
	always @ (posedge in_CLK)
		if(in_EN)
			data_out<=in_D;

endmodule