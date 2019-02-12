module controlTestbench;
	reg reset;
	reg [5:0] instruction5;
	wire RegDst,Branch,BranchTest,MemRead,Jump,MemtoReg,MemWrite,ALUSrc,RegWrite;
	wire [1:0] ALUOp;
	control control1(reset,instruction5,RegDst,Branch,Jump,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,BranchTest);
	initial begin
		instruction5=6'b000000;
	end
	initial begin 
		
		$shm_open("shm.db",1);
		$shm_probe("AS");
		#50 $finish;
		#100 $shm_close();
	end
	initial begin 
		#0 reset <=1;
		#5 reset<=0;
	end

endmodule 
