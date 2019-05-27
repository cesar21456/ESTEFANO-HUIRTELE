module InstructionMemory(input[31:0] dir,output [31:0]salida);
reg [7:0]InstMemory [0:255];

initial begin
	$readmemh("instructions.txt",InstMemory);
end

assign salida={InstMemory[dir],InstMemory[dir+1],InstMemory[dir+2],InstMemory[dir+3]};




endmodule
