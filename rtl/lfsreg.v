module lfsreg(input clk, input rst, output [4:0] lfsr);

	wire feedback;

	// register instantiations
	register reg3(.clk(clk), .rst(rst), .d(lfsr[4]), .q(lfsr[3]));
	register reg2(.clk(clk), .rst(rst), .d(lfsr[3]), .q(lfsr[2]));
	register reg1(.clk(clk), .rst(rst), .d(lfsr[2]), .q(lfsr[1]));
	register reg0(.clk(clk), .rst(rst), .d(lfsr[1]), .q(lfsr[0]));
	register reg4(.clk(clk), .rst(rst), .d(feedback), .q(lfsr[4]));
	
	// feedback statement
	assign feedback = lfsr[0] ^ lfsr[2];
	
endmodule
