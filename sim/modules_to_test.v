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

module register (input clk, input rst, input d, output reg q);

	always @(posedge clk, posedge rst) begin
		if (rst) q = 1'b1;
		else q = d;
	end

endmodule

module syncron(input clk_1, input clk_2, input [11:0] in, output [11:0] out);

	wire [11:0] cross_1;
	wire [11:0] cross_2;

	register12 clk_1_d_mod(.clk(clk_1), .d(in), .q(cross_1));
	register12 clk_2_in_mod(.clk(clk_2), .d(cross_1), .q(cross_2));
	register12 clk_2_out_mod(.clk(clk_2), .d(cross_2), .q(out));

endmodule

module register12 (input clk, input [11:0] d, output reg [11:0] q);

	always @(posedge clk) begin
		q = d;
	end

endmodule
