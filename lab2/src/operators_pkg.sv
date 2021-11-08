// Coder:           DSc Abisai Ramirez Perez
// Date:            24 April 2019
// Name:            operators_pkg.sv
// Description:     This is the package of operators

`ifndef OPERATORS_PKG_SV											//if OPE.._PKG_SV is not defined
    `define OPERATORS_PKG_SV										//then define it
	 
package operators_pkg;												//we start a package (it's a building block)

`ifdef USIGNED_OP
    localparam  W_DW     = 5;
	 
    typedef logic [W_DW-1:0]        datawidth_t;
    typedef logic [2*W_DW-1:0]      prod_dtwd_t;
    typedef logic [W_DW:0]          sumdif_dw_t;
    typedef logic [W_DW:0]          w_rshift1_t;
    typedef logic [W_DW+1:0]        w_rshift2_t;
    typedef logic [3*W_DW-1:0]      datawidt3_t;
`else
    localparam  W_DW     = 5;
    typedef logic signed [W_DW-1:0]        datawidth_t;
    typedef logic signed [2*W_DW-1:0]      prod_dtwd_t;
    typedef logic signed [W_DW:0]          sumdif_dw_t;
    typedef logic signed [W_DW:0]          w_rshift1_t;
    typedef logic signed [W_DW+1:0]        w_rshift2_t;
    typedef logic        [3*W_DW-1:0]      datawidt3_t;
`endif

endpackage
`endif
