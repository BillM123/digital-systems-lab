`timescale 1ns/10ps

module vsync_tb;

    reg clk, reset, pixel_ok;
    wire RGB, VSYNC;
    wire [6:0] VPIXEL;

    vsync vsync_inst(clk, reset, pixel_ok, RGB, VSYNC, VPIXEL);

    initial begin
        $dumpfile("vsync_tb.vcd");
        $dumpvars(0, vsync_tb);

        clk = 0;
        reset = 1;
        pixel_ok = 0;
        
        #50 reset = 0;
        
        #180000000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule