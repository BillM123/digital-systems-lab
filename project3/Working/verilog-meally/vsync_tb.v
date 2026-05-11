`timescale 1ns/10ps

module vsync_tb;

    reg clk, reset;
    wire RGB, HSYNC;
    wire [7:0] HPIXEL;

    vsync vsync_inst(clk, reset, RGB, HSYNC, HPIXEL);

    initial begin
        $dumpfile("vsync_tb.vcd");
        $dumpvars(0, vsync_tb);

        clk = 0;
        reset = 1;
        
        #50 reset = 0;
        
        #180000000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule