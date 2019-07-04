module tb();
reg clk;
reg[31:0] pc;
wire[31:0] pcadded,newdir,pcf;
wire[27:0] fjump;
wire RegDst,Branch,MemtoReg,ALUSrc,RegWrite;
wire[1:0] Jump;
wire[1:0] MemRead,Memwrite;
wire[6:0] ALUOP;
wire[5:0] control;
wire[31:0] instruction,dir;
wire[31:0] read1,read2,salida_alu,jumpreg;
wire zero;
wire[31:0] salida_signextend,salida_mux;
wire overflow;
wire[31:0]READDATA;
wire[31:0]salida_mux_2,salida_mux_1,salida_mux_branch;
wire[4:0]salida_mux_reg;
PC programcounter(clk,pc,dir);
InstructionMemory test1(dir,instruction);
PCAdder addition(pc,pcadded);
//mux MUX_DIRECCION(newdir,pcadded,Jump,pcf);
shiftleft jumpshift(instruction[25:0],fjump);
ControlUNIT controlunit(instruction[31:26],RegDst,Branch,MemtoReg,ALUSrc,RegWrite, ALUOP,Memwrite,MemRead,Jump);
RegFile regfile(RegWrite,clk,instruction[25:21],instruction[20:16],salida_mux_reg,read1,read2,salida_mux_2,jumpreg,Jump,pcf);
//mux MUX_JUMP(1,0,Jump,salida_mux_1);
mux_de_5 MUX_register(instruction[15:11],instruction[20:16],RegDst,salida_mux_reg);
signextension SIGNEXTENSION(instruction[15:0],salida_signextend);
mux MUX_REGISTER_MEMORY(salida_signextend,read2,ALUSrc,salida_mux);
alucontrol ALUCONTROL(instruction[5:0],ALUOP,control);
alu ALU(read1,salida_mux,overflow,control,salida_alu,zero);
mux MUX_BRANCH(salida_signextend,pcadded,(zero&Branch),salida_mux_branch);
jump jumper(fjump,Jump,salida_mux_branch,pcf,jumpreg);
datamemory DATAMEMORY(salida_alu,read2,READDATA,MemRead,Memwrite);
mux MUX_DATA_MEMORY(READDATA,salida_alu,MemtoReg,salida_mux_2);

initial
begin
	
	clk=1;
	pc=4;
	#100
	clk=0;
	#100
	pc=pcf;
	clk=1;
end
always@(clk)
begin
	$display("%b",clk);
	$monitor("tb:   Instruction is %b, Regwrite is %b, AluOP is %b, y 6 mas significativos son %b",instruction,RegWrite,ALUOP,instruction[31:26]);
  	$display("tb:   Direccion is %b, con instruccion %b, pc is %b, pc added is %b",dir,instruction[31:26],pc,pcadded);
end
endmodule
