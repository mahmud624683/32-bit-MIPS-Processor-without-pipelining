module AluTestbench;
	reg reset;
	reg [31:0] A,B;
	reg [3:0] ALUCon;
	wire zero;
	wire [31:0] ALUResult;
	ALU alu(reset,A,B,ALUCon,Zero,ALUResult);
	initial begin
		A=12;
		B=21;
		ALUCon=4'b0010;
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
