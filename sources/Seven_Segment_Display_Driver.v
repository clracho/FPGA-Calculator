`timescale 1ns / 1ps

// This module uses 7 muxes to select what each of the
// 7 segments of the seven segment display should be given
// 5 bits of data.

module Seven_Segment_Display_Driver(
    input V, W, X, Y, Z,
    output CA, CB, CC, CD, CE, CF, CG
    );
// SEGMENT CA    
mux #(32,1) mux_CA (
	.data_out(CA),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0} )
);
// SEGMENT CB
mux #(32,1) mux_CB (
	.data_out(CB),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0} )
);
// SEGMENT CC
mux #(32,1) mux_CC (
	.data_out(CC),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0} )
);
// SEGMENT CD
mux #(32,1) mux_CD (
	.data_out(CD),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0} )
);
// SEGMENT CE
mux #(32,1) mux_CE (
	.data_out(CE),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b0} )
);
// SEGMENT CF
mux #(32,1) mux_CF (
	.data_out(CF),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0} )
);
//SEGMENT CG
mux #(32,1) mux_CG (
	.data_out(CG),
	.select_in( {V,W,X,Y,Z} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1} )
);
endmodule
