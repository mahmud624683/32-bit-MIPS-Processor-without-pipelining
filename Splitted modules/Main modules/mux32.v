module mux32(D0,D1,select,Out);
	input [31:0]D0,D1;
	input select;
	output reg [31:0] Out;
	always@(*)
		if(select)
			Out<=D1;
		else Out<=D0;
endmodule 
