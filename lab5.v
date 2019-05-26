module PC(input clk,input pc,output reg direccion,output dir);

always @(posedge clk)begin 
direccion=pc;
end

assign dir = direccion;
endmodule





module ControlUNIT(input [5:0] primeros_seis,output RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump);

assign RegWrite= (primeros_seis==0)?1: //Instrucciones tipo R
		 ((primeros_seis>=8)&(primeros_seis<=14))?1:0; //Inmediatos


assign RegDst= (primeros_seis==0)?1:0;//Instrucciones tipo R


assign ALUOP= (primeros_seis==0)?1: //Instrucciones tipo R
	       ((primeros_seis>=8)&(primeros_seis<=14))?1: //Inmediatos
		((primeros_seis==1)|(primeros_seis>=4)&(primeros_seis<=7))?1:0; //Branches y Jumps

assign ALUSrc= ((primeros_seis>=8)&(primeros_seis<=14))?1:0;//Inmediatos

assign Branch= ((primeros_seis==1)|(primeros_seis>=4)&(primeros_seis<=7))?1:0; //Branches

assign Jump= (primeros_seis==1|primeros_seis==2)?1:0; //Jump

assign MemRead=(primeros_seis>=32 & primeros_seis<=38)?1:0; //Load word

assign MemWrite=(primeros_seis>=38 & primeros_seis<=46)?1:0; //Store word

assign MemtoReg=(primeros_seis>=32 & primeros_seis<=38)?1:0; //Load word

endmodule 


module InstructionMemory(input dir,output [31:0]salida);
reg [7:0]memory [0:255];

initial begin
	$readmemh("instructions.txt",memory);
end

assign salida={memory[dir],memory[dir+1],memory[dir+2],memory[dir+3]};



endmodule
