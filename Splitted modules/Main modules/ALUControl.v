module ALUControl(instruction1,ALUop,ALUCon);
	input [5:0] instruction1;
	input [1:0]ALUop;
	output reg [3:0] ALUCon;
	wire [7:0] ALUControlIn;  
	assign ALUControlIn = {ALUop,instruction1};
	
	always@(*)
	begin
		casex(ALUControlIn)
			8'b10100000: ALUCon=4'b0010;//ADD
			8'b10100010: ALUCon=4'b0110;//SUB
			8'b10100100: ALUCon=4'b0000;//AND
			8'b10100101: ALUCon=4'b0001;//OR
			8'b10101010: ALUCon=4'b0111;//SLT
			8'b10101111: ALUCon=4'b0011;//NOR
			8'b01xxxxxx: ALUCon=4'b0110;//BEQ & BNE
			8'b00xxxxxx: ALUCon=4'b0010;//lw sw jmp addi
			default: ALUCon=4'b0010;
		endcase
	end
	
endmodule 
