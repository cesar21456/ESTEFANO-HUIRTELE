module InstructionMemory(input [31:0]dir,output [31:0]salida);
reg [7:0]memory [0:255];

initial begin
	$readmemh("instructions.txt",memory);
end

assign salida={memory[dir-4],memory[dir-3],memory[dir-2],memory[dir-1]};

always@(*)begin
	$monitor("la salida del instruction memory es %b",salida);
end 

endmodule
