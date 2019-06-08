
module tb();
reg clk;
wire RegDst,Branch,MemRead,MemtoReg,Memwrite,ALUSrc,RegWrite,Jump;
wire [6:0]ALUOP;
wire [5:0] control;
wire[31:0] instruction,dir;
wire [31:0] read1,read2,salida_alu;
wire zero;
wire[31:0] salida_signextend,salida_mux;
wire overflow;
wire [31:0]READDATA;
wire [31:0]salida_mux_2;
PC programcounter(clk,dir);
InstructionMemory test1(dir,instruction);
ControlUNIT controlunit(instruction[31:26],RegDst,Branch,MemRead,MemtoReg,Memwrite,ALUSrc,RegWrite,Jump, ALUOP);
RegFile regfile(RegWrite,clk,instruction[25:21],instruction[20:16],instruction[15:11],read1,read2,salida_mux_2);
signextension SIGNEXTENSION(instruction[15:0],salida_signextend);
mux MUX_REGISTER_MEMORY(salida_signextend,read2,ALUSrc,salida_mux);
alucontrol ALUCONTROL(instruction[5:0],ALUOP,control);
alu ALU(read1,salida_mux,overflow,control,salida_alu,zero);
datamemory DATAMEMORY(Memwrite,MemRead,salida_alu,read2,READDATA);
mux MUX_DATA_MEMORY(READDATA,salida_alu,MemtoReg,salida_mux_2);


initial
begin

	clk=1;
	

end
initial
begin
	$monitor("Instruction is %b, Regwrite is %b, AluOP is %b",instruction,RegWrite,ALUOP);
end
endmodule
