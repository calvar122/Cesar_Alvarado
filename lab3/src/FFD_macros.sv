module FFD_macros //`define POS_RESET
#(
parameter WD = 2
)
(
input logic [WD-1:0] 	d,
input logic 		clk, reset,
output logic [WD-1:0] 	q
);

`ifdef POS_RESET

	always @(posedge clk, posedge reset)
	begin
		if(reset) 	q<=0;
		else begin
			if(clk)	q<=d;
		end
	end
	
	initial $display("ACHTUNG-->reset is posedge enabled");

`else	
	always@(posedge clk, negedge reset)
	begin
		if(!reset) 	q<=0;
		else begin
			if(clk)	q<=d;
		end
	end	
	initial $display("ACHTUNG-->reset is negedge enabled");
	//initial $printtimescale(FFD_macros);
`endif
endmodule
