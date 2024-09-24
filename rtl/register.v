module register (input clk, input rst, input d, output reg q);

	always @(posedge clk, posedge rst) begin
		if (rst) q = 1'b1;
		else q = d;
	end

endmodule
