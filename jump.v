module jump(fjump,Jump,pcadded,newdir);
input[31:0] pcadded;
input[27:0] fjump;
input Jump;
wire[31:0] temp;
output[31:0] newdir;


assign temp=newdir;
always@(fjump)
begin
	$display("Jump is %b and temp is %b",Jump, temp);
end

assign newdir=(Jump==1)?({pcadded[31:28],fjump}):temp;

endmodule
