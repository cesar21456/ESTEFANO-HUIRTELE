module InstructionMemory(input dir,output [31:0]salida);
reg [7:0]memory [0:255];

initial begin
	$readmemh("instructions.txt",memory);
end

assign salida={memory[dir],memory[dir+1],memory[dir+2],memory[dir+3]};



endmodule




