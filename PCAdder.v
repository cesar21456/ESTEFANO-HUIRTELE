module PCAdder(pc,pcadded);
input[31:0] pc;
output[31:0] pcadded;


assign pcadded=pc+4;
always@(pc) begin
	$display("Adder: pc is %b and pc added is %b",pc,pcadded);
end


endmodule

