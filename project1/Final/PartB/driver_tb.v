`timescale 1ns/10ps

module driver_tb;
    reg reset, clk;
    wire an0, an1, an2, an3;

    leddriver driver_bench (reset, clk, an0, an1, an2, an3);

    initial begin
        $dumpfile("driver_tb.vcd");
        $dumpvars(0, driver_tb);
        
        reset = 0;
        clk = 0;
        
        #5 reset = 1;
        #14 reset = 0;

        #197 reset = 1;
        #5 reset = 0; 

        #300 reset = 1;
        #1000 reset = 0;

        #500 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
endmodule