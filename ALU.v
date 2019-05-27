module alu(read1,foutput,overflow,control,oc);
output reg overflow;
output reg [31:0] oc;
wire[31:0]out;
input[5:0]control;
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
