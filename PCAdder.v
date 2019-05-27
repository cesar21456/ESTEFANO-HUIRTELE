module PCAdder(current,next);
input[31:0] current;
output[31:0] next;

assign next=current+4;
initial
begin
	$strobe("Current is %b and next is %b",current,next);
end

endmodule
