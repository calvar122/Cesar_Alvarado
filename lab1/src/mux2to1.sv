module mux2to1
	#(parameter DW=4)
	(input logic [DW-1:0] a, b,
	 input 	s,
	 output logic[DW-1:0] o);

//Nets and variables declaration

assign o = s?b:a;

endmodule
	