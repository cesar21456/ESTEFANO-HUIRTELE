module tb();
reg clk,pc;
wire dir,direccion,RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump;
wire[31:0] instruction;
reg[7:0] memory[0:255];
PC programcounter(clk,pc,direccion,dir);
InstructionMemory test1(dir,instruction);
ControlUNIT controlunit(instruction[31:26],RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump);

initial
begin
	pc=0;
	clk=1;
	clk=~clk;
	#10;
	pc=4;
	clk=~clk;
	clk=~clk;

end
initial
begin
	$monitor("Instruction is %b, Regwrite is %b, AluOP is %b",instruction,RegWrite,ALUOP);
end
endmodule

