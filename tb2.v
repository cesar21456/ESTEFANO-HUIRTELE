module tb();
reg clk,pc;
wire dir,direccion,RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump;
wire[31:0] instruction;
wire [31:0] read1,read2,write1;
wire[31:0] salida_signextend,salida_mux,salida_alu;
wire overflow;
PC programcounter(clk,pc,direccion,dir);
InstructionMemory test1(dir,instruction);
ControlUNIT controlunit(instruction[31:26],RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump);
RegFile regfile(RegWrite,clk,instruction[25:21],instruction[20:16],instruction[15:11],read1,read2,write1);
signextension SIGNEXTENSION(instruction[15:0],salida_signextend);
mux MUX(read2,salida_signextend,ALUSrc,salida_mux);
alu ALU(read1,salida_mux,overflow,instruction[5:0],salida_alu);


initial
begin
	pc=0;
	clk=1;
	

end
initial
begin
	$monitor("Instruction is %b, Regwrite is %b, AluOP is %b",instruction,RegWrite,ALUOP);
end
endmodule
