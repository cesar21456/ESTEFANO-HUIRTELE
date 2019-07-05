module shiftleft(jumpi,fjump);
input[25:0] jumpi;
output[27:0] fjump;
assign fjump=jumpi*4;


endmodule
