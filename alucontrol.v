module alucontrol(input [5:0]ultimos_seis,input[6:0] primeros_seis,output wire[5:0] salida);

assign salida=(primeros_seis[6]&primeros_seis[5:0]==35|primeros_seis[5:0]==32|primeros_seis[5:0]==33|primeros_seis[5:0]==40|primeros_seis[5:0]==41|primeros_seis[5:0]==43)?16:
		(primeros_seis[6])?primeros_seis[5:0]:ultimos_seis;

endmodule
