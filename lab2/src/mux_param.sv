// Coder:           Ing. Cesar Alvarado
// Date:            07 November 2021
// Name:            mux_param.sv
// Description:     This is n to 1 parametirized multilexer.

`ifndef MUX_PARAM_SV			//Directiva: Si xx_SV no esta definido
    `define MUX_PARAM_SV		//Directiva: pues se define
	 
module mux_param			
//import operators1_pkg::*;			//importing operators_pkg		
#( 								//parameters declaration
parameter		WD		 = 8,
parameter 		bitsel = 2 	//works for sel and inputs
)
(												//i/o declaration and initialization
output  	[WD-1:0] 			out,		//output with same with as inputs
input  	[bitsel-1:0]		sel,			//number of selec bits
input  	[WD-1:0]				in[2**bitsel] //input of same width as output, and 2**bitsInSel number of inputs

);

	 
//NO CASE, NO IF-ELSE
assign out = in[sel];

endmodule
`endif