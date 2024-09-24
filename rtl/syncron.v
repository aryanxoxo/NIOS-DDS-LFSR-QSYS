module syncron(input clk_1, input clk_2, input [11:0] in, output [11:0] out);

	wire [11:0] cross_1;
	wire [11:0] cross_2;

	register12 clk_1_d_mod(.clk(clk_1), .d(in), .q(cross_1));
	register12 clk_2_in_mod(.clk(clk_2), .d(cross_1), .q(cross_2));
	register12 clk_2_out_mod(.clk(clk_2), .d(cross_2), .q(out));

endmodule
