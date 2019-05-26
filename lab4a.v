module registers (input reg clk,input reg [4:0]leerA,leerB,escribirA,input reg[31:0]mensajeAescribir,output wire[31:0]registroleido1,registroleido2);
reg[31:0]regfile[31:0];
initial begin
$readmemb("base_de_datos2.txt",regfile);
end



	 assign registroleido1=regfile[leerA];
	 assign registroleido2=regfile[leerB];

always@(negedge clk)
begin
regfile[escribirA]=mensajeAescribir;
$display("hola desde registers %b",regfile[escribirA]);
end




endmodule

module ALU(input [3:0]control1,input [31:0]entrada1,entrada2,output wire [31:0]salida,output reg overflow,input clk);
reg [31:0]salida2;
always @(*)
begin
overflow=0;
if (control1==2)
begin
	{overflow,salida2}={1'b0,entrada1}+{1'b0,entrada2};
$display("hola desde ALU ");
end
end

assign salida= (control1==0)?entrada1&entrada2:(
		(control1==1)?entrada1|entrada2:(
		(control1==2)?salida2:(
		(control1==6)?entrada1-entrada2:(
		(control1==7)?((entrada1<entrada2)?1:0):(
		(control1==12)?~(entrada1|entrada2):0)))));
		
endmodule


module mux_de_2_a_1(input clk,input [31:0]entrada1,input[31:0]entrada2,input select,output wire[31:0]salida);

assign salida=(select==1)?entrada1:entrada2;
always@(clk)begin
$display("hola desde mux ");
end
endmodule

module sign_extend(input clk,input [15:0]entrada,output wire[31:0]salida);

assign salida[15:0]=entrada;
assign salida[31:16]=0;
always@(clk)begin
$display("hola desde sign extend ");
end
endmodule

module tarea_basica(input wire[4:0]leerA,leerB,escribirA,input wire[3:0]control,input wire select,input reg[15:0] inmediato,input wire clk,output wire overflow);
wire[31:0]mensajeAescribir;
wire [31:0]registroleido1,registroleido2;
wire[31:0] salida_mux,salida_inmediato;




registers a (clk,leerA,leerB,escribirA,mensajeAescribir,registroleido1,registroleido2);
sign_extend b (clk,inmediato,salida_inmediato);
mux_de_2_a_1 c(clk,registroleido2,salida_inmediato,select,salida_mux);
ALU d(control,registroleido1,salida_mux,mensajeAescribir,overflow,clk);



endmodule

