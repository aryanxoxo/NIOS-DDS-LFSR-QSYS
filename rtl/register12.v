module register12 (input clk, input [11:0] d, output reg [11:0] q);

	always @(posedge clk) begin
		q = d;
	end

endmodule
