module RegFile(clk,inA,inB,inC,read1,read2,out);
input clk;
input[31:0] out;
reg[31:0] memory[0:31];
input[4:0] inA,inB,inC;
output [31:0] read1,read2;
initial
begin
	$readmemb("text.txt",memory);
end
        assign read1=memory[inA];
        assign read2=memory[inB];
	
always@(negedge clk)
begin
        memory[inC]=out;
	$display("guardado en posicion %b la cadena %b (prueba: %b)", inC, out, memory[inC]);
end

endmodule



module alu(clk,read1,foutput,inC,out,overflow,control,oc);
input clk;
output reg overflow;
output reg [31:0] oc;
input[4:0] inC;
output[31:0]out;
input[3:0]control;
input[31:0] foutput,read1;
reg[31:0] memory[31:0];

always @(*)
begin
	overflow=0;
	if(control==2)
	begin
		{overflow,oc}={1'b0,read1}+{1'b0,foutput};
	end
end

assign out=(control==0)?read1&foutput:(
	   	(control==1)?read1|foutput:(
			(control==2)?oc:(
	   			(control==6)?read1-foutput:(
	   				(control==7)?((read1<foutput)?1:0):~(read1|foutput)))));
endmodule


module mux(read2,inD2,controll,foutput);
input[31:0] read2,inD2;
input controll;
output[31:0] foutput;

assign foutput=(controll)?read2:inD2;

endmodule


module signextension(inD,inD2);
input[15:0] inD;
output [31:0] inD2;

	assign inD2[31:16]=0;
	assign inD2[15:0]=inD;

endmodule
