module mux_de_5(inst2,inst3,control,foutput);
input[4:0] inst2,inst3;
input control;
output[4:0] foutput;

assign foutput=(control)?inst2:inst3;
endmodule
