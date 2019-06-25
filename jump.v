module jump(fjump,Jump,pcadded,newdir);
input[31:0] pcadded;
input[27:0] fjump;
input Jump;
output[31:0] newdir;
assign newdir={pcadded[31:28],fjump};

always@(fjump)
begin
	$display("Jump: Jump is %b, newdir is %b  and fjump is %b",Jump,newdir, fjump);
end

endmodule
