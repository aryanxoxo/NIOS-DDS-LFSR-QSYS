module lfsreg_tb();

    reg clk, rst;
    wire [4:0] lfsr;


    lfsreg UUT(clk, rst, lfsr);

    // clock setup(s)
    initial begin 
        forever begin
            clk = 0;
            #1;
            clk = 1;
            #1;
        end 
    end

    initial begin
        rst = 1'b1;
        #2;
        rst = 1'b0;
        #40;
    $stop;
    end
endmodule