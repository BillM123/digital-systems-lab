`timescale 1ns/10ps

module top_tb;
    reg reset, clk;
    wire an0, an1, an2, an3;
    wire a, b, c, d, e, f, g, dp;

    FourDigitLEDdriver top_bench (reset, clk, an0, an1, an2, an3, a, b, c, d, e, f, g, dp);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        
        reset = 0;
        clk = 0;
        
        #5 reset = 1;
        #14 reset = 0;

        #197 reset = 1;
        #5 reset = 0; 

        #300 reset = 1;
        #1000 reset = 0;

        #2000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
endmodule