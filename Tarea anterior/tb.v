module tb;
reg controll,clk;
reg[3:0] control;
reg[31:0] memory[0:31];
reg[4:0] inA,inB,inC;
reg[15:0] inD;

wire[31:0] oc;
wire overflow;
wire[31:0] out,read1,read2,foutput;
wire[31:0] inD2;

initial
begin
        $readmemb("text.txt",memory);
end


RegFile test1(clk,inA,inB,inC,read1,read2,out);
signextension test2(inD,inD2);
mux test3(read2,inD2,controll,foutput);
alu test4(clk,read1,foutput,inC,out,overflow,control,oc);

initial
begin

	inD=16'b1;
	inA=5'b0;
	inB=5'b1;
	inC=5'b10;
	control=1;
	controll=1;
	clk=1;
	clk=~clk;
	#10
	inA=5'b1;
	inB=5'b10;
	inD=16'b11;
	controll=~controll;
	clk=~clk;
	clk=~clk;
	#10

	controll=~controll;
	control=0;
	clk=~clk;
	clk=~clk;
	#10
	controll=~controll;
	clk=~clk;
	clk=~clk;
	#10

	controll=~controll;
	inC=5'b1;
	inA=5'b111;
	inB=5'b110;
	control=2;
	clk=~clk;
	clk=~clk;
	#10
	inA=5'b1000;
	inB=5'b1000;
	inD=5'b1;
	controll=~controll;
	clk=~clk;
	clk=~clk;
	#10

	controll=~controll;
	inC=5'b10;
	inA=5'b111;
	inB=5'b110;
	control=6;
	clk=~clk;
	clk=~clk;
	#10;
	inA=5'b1000;
	inB=5'b1000;
	inD=5'b1;
	controll=~controll;
	clk=~clk;
	clk=~clk;
	#10


	controll=~controll;
	inC=5'b11;
	control=7;
	clk=~clk;
	clk=~clk;
	#10
	controll=~controll;
	inA=5'b1;
	clk=~clk;
	clk=~clk;
	#10

	controll=~controll;
	control=12;
	clk=~clk;
	clk=~clk;
	#10
	controll=~controll;
	clk=~clk;
	clk=~clk;

end


initial
begin
	$monitor("Output es %b,control es %b, control para inmediato esta en %b, foutput es %b y overflow es %b, primera lectura es %b, segunda lectura es %b e inmediato es %b.\n \n \n",out,control,controll,foutput,overflow,read1,read2,inD2);
end

/*
always
	#1 clk=~clk;
*/
endmodule
	


