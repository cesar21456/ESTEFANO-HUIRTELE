module mux(read2,inD2,controll,foutput);
input[31:0] read2,inD2;
input controll;
output[31:0] foutput;

assign foutput=(controll)?read2:inD2;

endmodule

