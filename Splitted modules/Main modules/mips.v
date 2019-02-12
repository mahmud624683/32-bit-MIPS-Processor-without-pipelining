module mips(input clk,reset,output[31:0] pc_out, alu_result);
	
	
	reg [31:0] PC;
	wire [31:0] pc_next,signExOut;
	wire [31:0] Instruction,WriteData,ReadData1,ReadData2,ALUin,ALUResult,MemoryData;
	wire RegDst,Branch,BranchTest,MemRead,Jump,MemtoReg,MemWrite,ALUSrc,RegWrite,zero;
	wire [1:0] ALUOp;
	wire [3:0] ALUCon;
	wire [4:0] WriteRegister;
	
	always @(posedge clk or posedge reset)  
	 begin   
		  if(reset)   
			   PC <= 0;  
		  else  
			   PC <= pc_next;  
	 end
	
	//calling ROM module;
	InstructionMemory InstructionMemory1(.ReadAddress(PC),.Instruction(Instruction));
	
	//calling Control module;
	control control1(.reset(reset),.instruction5(Instruction[31:26]),.RegDst(RegDst),.Branch(Branch),
						.Jump(Jump),.MemRead(MemRead),.MemtoReg(MemtoReg),.ALUOp(ALUOp),
						.MemWrite(MemWrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite),.BranchTest(BranchTest));
	
	//if R type operation, RegDest is 1 and destination register is assigned, else the second operand register is assigned
	assign WriteRegister=RegDst?Instruction[15:11]:Instruction[20:16];
	
	//calling Registers module		
	Registers registers1(.clk(clk),.ReadRegister1(Instruction[25:21]),.ReadRegister2(Instruction[20:16]),
						.WriteRegister(WriteRegister),.WriteData(WriteData),.ReadData1(ReadData1),
						.ReadData2(ReadData2),.RegWrite(RegWrite),.reset(reset));
	
	//calling ALUControl module
	ALUControl ALUControl1(.instruction1(Instruction[5:0]),.ALUop(ALUOp),.ALUCon(ALUCon));
	
	//sign extending for I and L type operations to convert 16 bit offset/constant to 32 bits
	assign signExOut={{16{1'b0}},Instruction[15:0]};
	
	//2-to-1 mus following the Register module, for Branch and L type operations
	mux32 mux32ALU(.D0(ReadData2),.D1(signExOut),.select(ALUSrc),.Out(ALUin));
	
	//calling ALU module
	ALU ALU1(.A(ReadData1),.B(ALUin),.ALUCon(ALUCon),.Zero(zero),.ALUResult(ALUResult));
	
	//calling DataMemory module for L type operation
	DataMemory DataMemory1(.clk(clk),.Address(ALUResult),.WriteData(ReadData2),.ReadData(MemoryData),
							.MemRead(MemRead),.MemWrite(MemWrite),.reset(reset));
							
	//2-to-1 mux following the DataMemory module, chooses either ALUResult or data from Memory
	mux32 mux32DataMem(.D0(ALUResult),.D1(MemoryData),.select(MemtoReg),.Out(WriteData));
	
	//calling PCModule
	pcModule pcModule1(.Zero(zero),.Branch(Branch),.BranchTest(BranchTest),.Jump(Jump),.PC(PC),.instruction1(signExOut),.instruction6(Instruction[25:0]),.pc_next(pc_next));
	
	//assigning outputs
	assign pc_out=pc_next;
	assign alu_result=ALUResult;

endmodule 