module PC(input clk,input[31:0] pc,output[31:0] direccion);

assign direccion=pc;
always@(clk)
begin
        $display("Program counter: PC is %b, and direccion is %b ",pc,direccion);
        $monitor("PC is %b, and direccion is %b",pc,direccion);
end
endmodule

