
module datamemory(input MemWrite, MemRead,input[31:0] Adress, WriteData,output wire[31:0]ReadData);
reg [31:0]DATA[0:63];

initial begin
	$readmemb("text.txt",DATA);
end

assign ReadData=(MemRead)?DATA[Adress]:0;

always@(*)begin
if (MemWrite)
	DATA[Adress]=WriteData;
	$monitor("la data escrita en %b es WriteData %b y lo que se guardo fue %b",Adress,WriteData,DATA[Adress]);
end

endmodule 
