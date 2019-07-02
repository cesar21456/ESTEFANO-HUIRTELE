
module datamemory(input MemWrite,input[31:0] Address, WriteData,output wire[31:0]ReadData,output wire[1:0] MemRead);
reg [31:0]DATA[0:63];

initial begin
	$readmemb("memory.txt",DATA);
end

assign ReadData=(MemRead==1)?{24'b0,DATA[Address][7:0]}:
		(MemRead==2)?{16'b0,DATA[Address][15:0]}:
		(MemRead==3)?(DATA[Address]):0;

always@(*)begin
if (MemWrite)
begin
	DATA[Address]={16'b0,WriteData[15:0]};
	$display("la data escrita en %b es WriteData %b y lo que se guardo fue %b",Address,WriteData[15:0],DATA[Address]);
end
end

endmodule 
