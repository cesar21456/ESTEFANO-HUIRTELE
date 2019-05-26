module tb();
reg dir;
wire[31:0] instruction;

InstructionMemory test1(dir,instruction);

initial
begin
	dir=8'h00;
end
initial
begin
	$monitor("Instruction is %b",instruction);end
endmodule

