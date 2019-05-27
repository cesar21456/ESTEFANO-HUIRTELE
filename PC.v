module PC(input clk,input[31:0] pc,output[31:0] direccion,output reg pc1);
always @(*)begin
	if(pc1!=0)
	begin
		pc1=0;
	end
end
assign direccion=(pc1==0)?0:pc;
initial
begin
	$strobe("PC is %b, and direccion is %b,pc1 is %b",pc,direccion,pc1);
end
endmodule
