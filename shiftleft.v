module shiftleft(jumpi,fjump);
input[25:0] jumpi;
output[27:0] fjump;
assign fjump=jumpi*4;

always@(*)
begin
	$display("sll:  jumpi is %b fjump is %b",jumpi,fjump);
end
endmodule
