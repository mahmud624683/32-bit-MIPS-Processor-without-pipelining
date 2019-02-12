module pcModule(input Zero,Branch,BranchTest,Jump,input [31:0]PC,instruction1,
				input[25:0] instruction6,output [31:0]pc_next);
		wire [31:0] pc2,pc3,pc4,pc5,pc;
		wire pc6;
		
		assign pc4=PC+4;//KoggeStone32 add1(PC, 4, pc4);//pc4=PC+4;
		assign pc5=pc4+{instruction1[29:0],{2{1'b0}}};
		assign pc2={pc4[31:28],instruction6[25:0],{2{1'b0}}};
		assign pc6=(BranchTest^Zero) & Branch;
		mux32 m2(pc4,pc5,pc6,pc3);
		mux32 m1(pc3,pc2,Jump,pc_next);
endmodule 


