//TB for 2to1 mux
`timescale 10ps/1ps
module TB_mux2to1();

parameter DW = 2;
//inputs
reg [DW-1]a,b;
reg s;

integer o_gold, n_errores;
integer i,j,k;

//outputs
wire [DW-1] o;

//Instanciacion
mux2to1 DUT(.a(a),.b(b),.s(s),.o(o));

//initialization inputs
	//si no esta definido se inicializa de la siguiente manera
	`ifdef auto_init //directiva de sistema para inicializar en MS
		initial begin
			k=0; i=0; j=0; 
			s=k; a=i; b=j; 
		end
	`endif
	
initial #500 $finish; //simulation time
initial n_errores = 0;

initial begin
	for (k=0; k<=1; k=k+1)begin
		for (i=0; i<=DW; i=i+1)begin
			for (j=0; j<=DW; j=j+1)begin
				//checker begins comparation
				s=k; a=i; b=j;
				if(k==1)
					o_gold = j;
				else
					o_gold = i;
				//El scope nos notifica los errores
				#1 if(o ^ o_gold) begin
					n_errores = n_errores+1;
					$display("Error! select is: %b",s);
					$display("Error! input a is: %b(%d)",a,a);
					$display("Error! input b is: %b(%d)",b,b);
					$display("Valor esperado de salida: %b(%d)",o_gold,o_gold);
					$display("Valor obtenido de salida: %b(%d)",o,o);
				end
			end
		end
	end
	$display("Numero de errores:%d",n_errores);
end //fin checker inyeccion de valores y scope

endmodule
		