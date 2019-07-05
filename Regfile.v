module RegFile(RegWrite,clk,inA,inB,inC,read1,read2,out,jumpreg,Jump,pcf,ultimos_seis);
input RegWrite;
input clk;
input[1:0] Jump;
input[31:0] out,pcf;
reg[31:0] memory[0:31];
input[4:0] inA,inB,inC;
output [31:0] read1,read2;
output[27:0] jumpreg;
input [5:0]ultimos_seis;
initial
begin
	$readmemb("text.txt",memory);
	
end
        assign read1=memory[inA];
        assign read2=memory[inB];
	//assign jumpreg=read1[26:0];
	assign jumpreg={read1[25:0],2'b0};
	
always@(negedge clk)
begin
	if(RegWrite==1&ultimos_seis!=8)
	begin
        	memory[inC]=out;
				$display("guardado en posicion %b la cadena %b (prueba: %b)", inC, out, memory[inC]);
	end
	if(Jump==1)begin
		memory[31]=pcf+4;
		
		end

end
always@(*)begin
	$display("memory [inA] %b es ",memory[inA]);
end




endmodule

