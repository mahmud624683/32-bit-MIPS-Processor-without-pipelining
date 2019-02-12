module Registers(clk,ReadRegister1,ReadRegister2,WriteRegister,WriteData,ReadData1,ReadData2,RegWrite,reset);
	input [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [31:0] WriteData;
	input RegWrite,reset,clk;
	output [31:0] ReadData1,ReadData2;
	reg [31:0] regBank [8:0];
	integer i;
	always@ (posedge clk)
	begin
	if(reset) 
		for(i=0;i<9;i=i+1)  
                regBank[i] <= 0;
    	else begin
		if(RegWrite)
			regBank[WriteRegister]<=WriteData;
	end
	end
	assign ReadData1=regBank[ReadRegister1];
	assign ReadData2=regBank[ReadRegister2];
endmodule 
