module jump(fjump,Jump,pcadded,newdir,jumpreg);
input[31:0] pcadded,jumpreg;
input[27:0] fjump;
input[1:0] Jump;
wire[31:0] temp;
output[31:0] newdir;
assign temp=newdir;
always@(fjump)
begin
	$display("Jump is %b, jumpreg is %b, pcadded is %b and temp is %b",Jump, jumpreg, pcadded, temp);
end
//assign newdir=(Jump==1)?({pcadded[31:28],fjump}):(Jump==2)?jumpreg:temp;
assign newdir=(Jump==1|Jump==3)?({pcadded[31:28],fjump}):(Jump==2)?jumpreg:pcadded;

always@(newdir)
begin
	$display("Jumper: Dir final es %b",newdir);
end
endmodule
