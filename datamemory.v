
module datamemory(input MemWrite, MemRead,input[31:0] Address, WriteData,output wire[31:0]ReadData);
reg [31:0]DATA[0:63];

initial begin
	$readmemb("memory.txt",DATA);
end

assign ReadData=(MemRead)?DATA[Address]:0;

always@(*)begin
if (MemWrite)
begin
	DATA[Address]=WriteData;
	$display("la data escrita en %b es WriteData %b y lo que se guardo fue %b",Address,WriteData,DATA[Address]);
end
end

endmodule 
