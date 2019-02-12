module DataMemory(clk,Address,WriteData,ReadData,MemRead,MemWrite,reset);
	input[31:0] Address,WriteData;
	input MemRead,MemWrite,reset,clk;
	output reg [31:0] ReadData;
	
	integer i;  
    	reg [31:0] ram [31:0];
    	wire [4:0] ramAddress = Address[4:0];
	
	always@(posedge clk)
	begin
		if(reset)
		begin 
		   	for(i=0;i<31;i=i+1)  //we have to assign ram values here
		        ram[i] <=0; 
		end
		else begin
			if(MemWrite)
				ram[ramAddress] <= WriteData;
		end
		ReadData = (MemRead==1'b1) ? ram[ramAddress]:0;
	end
				
endmodule 
