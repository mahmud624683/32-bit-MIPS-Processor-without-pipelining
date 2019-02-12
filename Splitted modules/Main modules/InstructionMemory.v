module InstructionMemory(ReadAddress,Instruction);
	input[31:0] ReadAddress;
	output reg [31:0] Instruction;
	
	//integer i;  
    reg [31:0] rom [15:0];
    wire [3:0] romAddress = ReadAddress[5:2];  
      initial begin  
           //for(i=0;i<64;i=i+1)  //we have to assign instruction values here
           //     rom[i] <=0;
		rom[0]=32'h0;
		rom[1]=32'hA0210000;
		rom[2]=32'hA0420001;
		rom[3]=32'hA0630000;
		rom[4]=32'hA0840014;
		rom[5]=32'h222820;
		rom[6]=32'hA0410000;
		rom[7]=32'hA0A20000;
		rom[8]=32'hA0630002;
		rom[9]=32'h10640001;
		rom[10]=32'h98000005;
		rom[11]=32'hAC850005;
		rom[12]=32'h85302A;
		rom[13]=32'b00000000000000000000000000000000;
		rom[14]=32'b00000000000000000000000000000000;
		rom[15]=32'b00000000000000000000000000000000;
		  
      end 
	
	always@(*)
		Instruction<=rom[romAddress];
				
endmodule 
