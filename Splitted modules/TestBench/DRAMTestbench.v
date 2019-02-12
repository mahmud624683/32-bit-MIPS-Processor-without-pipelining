//use this testbench for Data Memory,Instruction memory and resister module 

module DRAMTestbench;
	reg [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite,reset,clk;
	wire [31:0] ReadData1,ReadData2;
	Registers RB(clk,ReadRegister1,ReadRegister2,WriteRegister,WriteData,ReadData1,ReadData2,RegWrite,reset);
	initial begin
		clk=1'b0;
		forever begin
			#5 clk=~clk;
		end
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
	initial begin 
		#5 RegWrite<=1;
			WriteData<=32;
			WriteRegister<=2;
		#15 RegWrite<=0;
			ReadRegister1<=2;
	end
	

endmodule 
