`timescale 1ns/10ps

module driver_tb;
    reg reset, clk, rotate;
    wire an0, an1, an2, an3;
    wire [3:0] char;

    leddriver driver_bench (reset, clk, rotate, an0, an1, an2, an3, char);

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
    initial begin
        forever begin
            #1500 rotate = 1;
            #200 rotate = 0;
        end
    end
endmodule