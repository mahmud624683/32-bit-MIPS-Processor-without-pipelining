module control(reset,instruction5,RegDst,Branch,Jump,MemRead,MemtoReg,
				ALUOp,MemWrite,ALUSrc,RegWrite,BranchTest);
	input reset;
	input [5:0] instruction5;
	output reg RegDst,Branch,BranchTest,MemRead,Jump,MemtoReg,MemWrite,ALUSrc,RegWrite;
	output reg [1:0] ALUOp;
	
	always@(*)
	begin
		if(reset) begin  
				RegDst=0;
				Branch=0;
				Jump=0;
				BranchTest=0;
				MemRead=0;
				MemtoReg=0;
				ALUOp=0;
				MemWrite=0;
				ALUSrc=0;
				RegWrite=0;	 
		  end  
		  else begin  
			  case(instruction5)
				6'b000000:begin//instruction for R-format instruction opcode 000000
					RegDst=1;
					Branch=0;
					Jump=0;
					BranchTest=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=2'b10;
					MemWrite=0;
					ALUSrc=0;
					RegWrite=1;
				end
				6'b100011:begin//instruction for lw 
					RegDst=0;
					Branch=0;
					Jump=0;
					BranchTest=0;
					MemRead=1;
					MemtoReg=1;
					ALUOp=2'b00;
					MemWrite=0;
					ALUSrc=1;
					RegWrite=1;
				end
				6'b101011:begin//instruction for sw
					RegDst=0;
					Branch=0;
					Jump=0;
					BranchTest=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=2'b00;
					MemWrite=1;
					ALUSrc=1;
					RegWrite=0;	
				end
				6'b101000:begin//instruction for addi
					RegDst=0;
					Branch=0;
					Jump=0;
					BranchTest=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=2'b00;
					MemWrite=0;
					ALUSrc=1;
					RegWrite=1;	
				end
				6'b100110:begin//instruction for jump
					RegDst=0;
					Branch=0;
					Jump=1;
					BranchTest=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=0;
					MemWrite=0;
					ALUSrc=0;
					RegWrite=0;	
				end
				6'b000100:begin//instruction for Beq
					RegDst=0;
					Branch=1;
					Jump=0;
					BranchTest=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=2'b01;
					MemWrite=0;
					ALUSrc=0;
					RegWrite=0;	
				end
				6'b000110:begin//instruction for Bne
					RegDst=0;
					Branch=1;
					Jump=0;
					BranchTest=1;
					MemRead=0;
					MemtoReg=0;
					ALUOp=2'b01;
					MemWrite=0;
					ALUSrc=0;
					RegWrite=0;	
				end
				default : 
				begin
					RegDst=0;
					Branch=0;
					Jump=0;
					MemRead=0;
					MemtoReg=0;
					ALUOp=0;
					MemWrite=0;
					ALUSrc=0;
					RegWrite=0;
				end
			endcase
		end
	end
	
	
endmodule 
