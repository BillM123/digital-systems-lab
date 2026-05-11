`timescale 1ns/10ps

module top_tb;

    reg clk, reset;
    wire VGA_VSYNC, VGA_HSYNC;
    wire VGA_RED, VGA_GREEN, VGA_BLUE;

    vga_controller vga_controller_inst(clk, reset, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        clk = 0;
        reset = 1;
        
        #10000 reset = 0;
        
        #180000000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule