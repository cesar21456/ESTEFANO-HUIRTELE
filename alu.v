module alu(read1,foutput,overflow,control,out,zero);
output reg overflow;
reg [31:0] oc;
output wire[31:0]out;
input[5:0]control;
input[31:0] foutput,read1;
reg[31:0] memory[31:0];
output wire zero;

always @(*)
begin
	overflow=0;
	if(control==16)
	begin
		{overflow,oc}={1'b0,read1}+{1'b0,foutput};
	end
end

assign out=(control==36)?read1&foutput:(
	   	(control==35)?read1|foutput:(
			(control==16)?oc:(
	   			(control==34)?read1-foutput:(
	   				(control==42)?((read1<foutput)?1:0):     
					(control==39)?~(read1|foutput):1   ))));

assign zero=(control==4&((read1-foutput)==0))?1:(
	     (control==5&(read1-foutput)!=0)?1:0);
endmodule
