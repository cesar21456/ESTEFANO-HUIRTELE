module datamemory(input[31:0] Address, WriteData,output wire[31:0]ReadData,output wire[1:0] MemRead,MemWrite);
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
	if(MemWrite==41)
		DATA[Address]={16'b0,WriteData[15:0]};
	else
		if(MemWrite==40)
			DATA[Address]={24'b0,WriteData[7:0]};
		else
			if(MemWrite==43)
				DATA[Address]=WriteData;
			$display("la data escrita en %b es WriteData %b y lo que se guardo fue %b",Address,WriteData[15:0],DATA[Address]);
end
end

endmodule 
