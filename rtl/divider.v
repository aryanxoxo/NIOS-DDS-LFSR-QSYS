module divider(input clk, input [31:0] divide, output reg new_clk);

	// 32 bits for integer values
	reg [31:0] r_reg;
	wire [31:0] r_next;
	reg reset;
	reg [31:0] old_div;
	
	// used for reseting counter
	always @(posedge clk) begin
		old_div <= divide;
	end
	
	// reset on new division value
	always @(*) begin
		if (divide !== old_div) begin
			reset <= 1'b1;
		end else begin
			reset <= 1'b0;
		end
	end
	
	// register to hold state for counter (code modelled from Chu textbook, section 4.3.2)
	always @(posedge clk, posedge reset) begin
			if (reset) begin
				r_reg <= 0;
			end else if (r_reg == divide - 1) begin
				r_reg <= 0;
			end else begin
				r_reg <= r_next;
			end
	end
	
	// next state logic for counter
	assign r_next = r_reg + 1;
	
	// logic for division of clk and output
	always @(posedge clk, posedge reset) begin
			if (reset) begin
				new_clk <= 0;
			end
			else if (r_reg == divide - 1) begin
				new_clk <= ~new_clk;
			end
			else begin
				new_clk <= new_clk;
			end
	end
endmodule
