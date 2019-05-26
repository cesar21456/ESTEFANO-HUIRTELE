module PC(input clk,input pc,output reg pc_salida);

always @(posedge clk)begin 
pc_salida=pc;
end
endmodule


module ControlUNIT(input [5:0] primeros_seis,output RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite);
//((primeros_seis==1)|(primeros_seis>=2)&(primeros_seis<=7)) =branches
//primeros_seis==0  =R
// primeros_seis>=8&primeros_seis<=14  = Inmediato (sin branches)
assign RegWrite= (primeros_seis==0)?1:
		 ((primeros_seis>=8)&(primeros_seis<=14)?1:0;
assign RegDst= (primeros_seis==0)?1:0;


assign ALUOP= (primeros_seis==0)?1:
	       ((primeros_sesi>=8)&(primeros_seis<=14))?1:
		((primeros_seis==1)|(primeros_seis>=2)&(primeros_seis<=7))?1:0;

assign ALUSrc= ((primeros_seis>=8)&(primeros_seis<=14)?1:0;

assign Branch= ((primeros_seis==1)|(primeros_seis>=2)&(primeros_seis<=7))?1:0;

		




endmodule 


module InstructionMemory(input dir,output [31:0]salida);
reg [7:0]memory [0:255];

initial begin
	$readmemh("instruction.txt",memory);
end

assign salida={memory[dir],memory[dir+1],memory[dir+2],memory[dir+3]};



endmodule 
