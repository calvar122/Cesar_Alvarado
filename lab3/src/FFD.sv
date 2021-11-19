module FFD
(
//parameter WD = 2;
input logic  	d,
input bit 		clk, reset,
output logic 	q
);

`include "FFD_macro.def"
`FFD_MACRO(d, clk, "negedge", reset, q);
`SEVERUS("INFO");
endmodule
