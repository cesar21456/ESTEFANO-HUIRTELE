module RegFile(RegWrite,clk,inA,inB,inC,read1,read2,out);
input RegWrite;
input clk;
input[31:0] out;
reg[31:0] memory[0:31];
input[4:0] inA,inB,inC;
output [31:0] read1,read2;
initial
begin
	$readmemb("text.txt",memory);
end
        assign read1=(RegWrite)?memory[inA]:0;
        assign read2=(RegWrite)?memory[inB]:0;
	
always@(negedge clk)
begin
	if(RegWrite)begin
        memory[inC]=out;
	$display("guardado en posicion %b la cadena %b (prueba: %b)", inC, out, memory[inC]);
end
end
endmodule
