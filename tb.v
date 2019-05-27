module tb();
reg clk;
wire pc1;
wire[31:0] direccion,dir,pc;
wire RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump;
wire[31:0] instruction;
reg[7:0] memory[0:255];
reg cont;
PC programcounter(clk,pc,direccion,pc1);
PCAdder add(direccion,pc);
InstructionMemory test1(direccion,instruction);
ControlUNIT controlunit(instruction[31:26],RegDst,Branch,MemRead,MemtoReg,ALUOP,Memwrite,ALUSrc,RegWrite,Jump);

initial

begin
	clk=1;
	clk=~clk;
	cont=0;
	#10;
	clk=1;
	clk=~clk;
	cont=1;
	#10;
	clk=1;
	clk=~clk;
	cont=0;

end
initial
begin
	$monitor("Instruction is %b, Regwrite is %b, AluOP is %b, direccion es %b,contador es %b",instruction,RegWrite,ALUOP,direccion,cont);
end
endmodule

