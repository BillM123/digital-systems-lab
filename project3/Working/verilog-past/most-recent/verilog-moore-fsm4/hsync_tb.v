`timescale 1ns/10ps

module hsync_tb;

    reg clk, reset;
    wire RGB, HSYNC;
    wire [7:0] HPIXEL;

    hsync hsync_inst(clk, reset, RGB, HSYNC, HPIXEL);

    initial begin
        $dumpfile("hsync_tb.vcd");
        $dumpvars(0, hsync_tb);

        clk = 0;
        reset = 1;
        
        #50 reset = 0;
        
        #18000000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule