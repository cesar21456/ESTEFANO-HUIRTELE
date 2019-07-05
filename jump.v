module jump(fjump,Jump,pcadded,newdir,jumpreg);
input[31:0] pcadded;
input[27:0] fjump,jumpreg;
input[1:0] Jump;
wire[31:0] temp;
output[31:0] newdir;
assign temp=newdir;

//assign newdir=(Jump==1)?({pcadded[31:28],fjump}):(Jump==2)?jumpreg:temp;
assign newdir=(Jump==1|Jump==3)?({pcadded[31:28],fjump}):(Jump==2&fjump[7:2]==8)?({pcadded[31:28],jumpreg}):pcadded;
always@(*)begin
$display("fjump [7:2] es %b",fjump[7:2]);
end

endmodule
