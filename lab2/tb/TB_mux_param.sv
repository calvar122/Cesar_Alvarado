//TestBench for mux_param
`timescale 1ns / 1ps				//Timescale

module tb_mux_param();			//Module of TB
import operators1_pkg::*;

reg [7:0] s[4];
reg [1:0] sel;
wire [7:0] q;

typedef struct {
logic [7:0] addr;
logic [3:0] data;
enum {RD,WR} op;
enum {EQN,EQ} op2;
} mem_ctl_st_t;

mem_ctl_st_t mistruct; //Create a structure variable of type mem_ctl...
integer o_gold;
integer k;

mux_param mux2(
.out(q), 
.sel(sel),
.in(s)
);



//initialization inputs
	//si no esta definido se inicializa de la siguiente manera
	`ifdef auto_init //directiva de sistema para inicializar en MS
		initial begin
			k=0; 
			mistruct = '{default:0}; //all elements of structure to 0
			
			sel=k; s[0]=mistruct.addr; s[1]=mistruct.data; s[2] = mistruct.op; s[3]=mistruct.op2;
		end
	`endif
	
initial #500 $finish; //simulation time

initial 
	begin
		
		for (k=0; k<=3; k=k+1)begin
				mistruct.addr =  50;
				mistruct.data =  4'b0010;
				mistruct.op[0] =1;
				mistruct.op2[0] =1;
						//checker begins comparation
						sel=k; s[0]=mistruct.addr; s[1]=mistruct.data; s[2]=mistruct.op[1]; s[3]=mistruct.op2[0] ;
						if(k==0)
							o_gold = mistruct.data;
						if(k==1)
							o_gold = mistruct.addr;
						if(k==2)
							o_gold = mistruct.op[0] ;	
						else
							o_gold = mistruct.op2[0];
						//El scope nos notifica los errores
				$display("Valor esperado de salida: %b(%d)",o_gold,o_gold);
				$display("Valor obtenido de salida: %b(%d)",q,q);
		end
		
	end //fin checker inyeccion de valores y scope

endmodule
