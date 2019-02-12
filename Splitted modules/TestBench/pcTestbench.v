module pcTestbench;
	reg Zero,Branch,BranchTest,clk,Jump,reset;
	reg [31:0]PC,instruction1;
	reg[25:0] instruction6;
	wire [31:0]pc_next;
	
	pcModule2 pc(reset,clk,Zero,Branch,BranchTest,Jump,PC,instruction1,instruction6,pc_next);
	initial begin
		Zero=0;
		Branch=1;
		BranchTest=0;
		Jump=0;
		PC=4;
		instruction1=2;
	end
	initial begin
		clk=1'b0;
		forever #5 clk=~clk;
		
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
