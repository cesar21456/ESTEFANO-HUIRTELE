module ControlUNIT(input [5:0] primeros_seis,output RegDst,Branch,MemRead,MemtoReg,Memwrite,ALUSrc,RegWrite,Jump,output wire[6:0] ALUOP);

assign RegWrite= (primeros_seis==0)?1: //Instrucciones tipo R
		 ((primeros_seis>=8)&(primeros_seis<=13)&(primeros_seis!=9)&(primeros_seis!=11))?1: //Inmediatos
		(primeros_seis==32|primeros_seis==33|primeros_seis==35)?1:0; //load word


assign RegDst= (primeros_seis==0)?1:0;//Instrucciones tipo R


assign ALUOP= ((primeros_seis==1)|(primeros_seis==4)|(primeros_seis==5))?{1'b1,primeros_seis}: //Branches 
	       ((primeros_seis>=8)&(primeros_seis<=13)&(primeros_seis!=9)&(primeros_seis!=11))?{1'b1,primeros_seis}: //Inmediatos
		(primeros_seis==40|primeros_seis==41|primeros_seis==43)?{1'b1,primeros_seis}: //store word
		(primeros_seis==32|primeros_seis==33|primeros_seis==35)?{1'b1,primeros_seis}: //load word
		(primeros_seis==0)?7'b0000000:0; //Instrucciones tipo R

assign ALUSrc= ((primeros_seis>=8)&(primeros_seis<=13)&(primeros_seis!=9)&(primeros_seis!=11))?1:
		(primeros_seis==40|primeros_seis==41|primeros_seis==43)?1: //store word
		(primeros_seis==32|primeros_seis==33|primeros_seis==35)?1:0; //load word//Inmediatos

assign Branch= ((primeros_seis==1)|(primeros_seis==4)|(primeros_seis==5))?1:0; //Branches

assign Jump= (primeros_seis==2|primeros_seis==3|primeros_seis==0)?1:0; //Jump

assign MemRead=(primeros_seis==32|primeros_seis==33|primeros_seis==35)?1:0; //Load word

assign MemWrite=(primeros_seis==40|primeros_seis==41|primeros_seis==43)?1:0; //Store word

assign MemtoReg=(primeros_seis>=32 & primeros_seis<=38)?1:0; //Load word

endmodule 
