module PC(input clk,input pc,output reg direccion,output dir);

always @(posedge clk)begin
	direccion=pc;
end

assign dir = direccion;
endmodule
