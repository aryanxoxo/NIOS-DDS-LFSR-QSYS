module syncron_tb();

    reg clk_1, clk_2;
    reg [11:0] in;
    wire [11:0] out;

    syncron UUT(clk_1, clk_2, in, out);

    // clock setup(s)
    initial begin 
        forever begin
            clk_1 = 0;
            #2;
            clk_1 = 1;
            #2;
        end 
    end

    initial begin 
        forever begin
            clk_2 = 0;
            #1;
            clk_2 = 1;
            #1;
        end 
    end

    initial begin
        in = 12'b0000_0000_0000;
        #30;
    $stop;
    end
endmodule