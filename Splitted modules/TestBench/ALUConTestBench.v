module AluConTestbench;
	reg reset;
	reg [5:0] instruction1;
	reg [1:0] ALUop;
	wire [3:0] ALUCon;
	ALUControl aluControl(reset,instruction1,ALUop,ALUCon);
	initial begin
		instruction1=6'b100000;
		ALUop=2'b10;
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
