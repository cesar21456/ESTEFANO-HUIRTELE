module PC(input clk,output[31:0] direccion);
reg[31:0] pc;
initial
begin
	pc=-4;
end

always@(posedge clk)begin
	pc=pc+4;
	$display("Now pc is %b",pc);
end

assign direccion=pc;
initial
begin
	$monitor("PC is %b, and direccion is %b",pc,direccion);
end
endmodule

