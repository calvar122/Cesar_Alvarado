`timescale 1ps / 1ps
/*<time_unit> / <time_precision>
* <time_unit> ------> delays and simulation time
* <time_precision --> how delays are rounded before being used in simulation
* ns -> 10^-9 
**ps -> 10^-12
*/

module TB_FFD();

//parameter WD= 2;
 logic  d;
 bit clk, reset;
 logic  q;

//FFD #(WD) 
FFD UUT(
		.d(d),
		.clk(clk),
		.reset(reset),
		.q(q)
);

//clock
always #5 clk = ~clk;
//initialization
initial begin
	clk	<=1;
	d	<= 1'b0;
	reset 	<= 1;

//stimulation
	#1  $display("Valor esperado=%b Valor obtenido:%b",gold,q);	
	#10 d 	 <= 1'b1;
	#11 $display("Valor esperado=%b Valor obtenido:%b",gold,q);
	#10 reset <= 1;

	
	#10 reset <= 0;
	#10 d 	  <= 1'b0;
	#1  $display("Valor esperado=%b Valor obtenido:%b",gold,q);
	
	#10 reset <= 1;
	#10 d 	  <= 1'b1;
	#1  $display("Valor esperado=%b Valor obtenido:%b",gold,q);
	
	#10 reset <= 1;

end	

endmodule
