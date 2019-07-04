module alu(read1,foutput,overflow,control,out,zero);
output reg overflow;
reg signed[31:0] oc ;
output wire [31:0]out ;
input[5:0]control;
input signed[31:0] foutput,read1 ;
output wire zero;

always @(*)
begin
	overflow=0;
	if(control==32|control==8)
	begin
		{overflow,oc}={1'b0,read1}+{1'b0,foutput};
	end
	$monitor("el control es %d",control);
end

assign out=(control==36|control==12)?read1&foutput:(
	   	(control==37|control==13)?read1|foutput:(
			(control==32|control==8)?oc:(
	   			(control==34|control==14)?read1-foutput:(
	   				(control==42|control==10)?((read1<foutput)?1:0):     
					(control==39)?~(read1|foutput):0   ))));

assign zero=(control==4&((read1-foutput)==0))?1:(
	     (control==5&(read1-foutput)!=0)?1:(
	     (control==1&(read1-foutput)>=0)?1:0));
endmodule
