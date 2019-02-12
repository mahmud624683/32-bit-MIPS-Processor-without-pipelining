module ALU(A,B,ALUCon,Zero,ALUResult);
	input [31:0] A,B;
	input [3:0] ALUCon;
	output reg [31:0] ALUResult;
	output reg Zero;
	always@(*)
	begin
		case(ALUCon)
			4'b0010: ALUResult=A+B;
			4'b0110: ALUResult=A-B;
			4'b0000: ALUResult=A & B;
			4'b0001: ALUResult=A | B;
			4'b0111: ALUResult=(A<B);
			4'b0011: ALUResult=~(A | B);
			default: ALUResult=A+B;
		endcase 
		Zero =(ALUResult==0);	
	end
endmodule 
