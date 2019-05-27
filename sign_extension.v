module signextension(inD,inD2);
input[15:0] inD;
output [31:0] inD2;

	assign inD2[31:16]=0;
	assign inD2[15:0]=inD;

endmodule
