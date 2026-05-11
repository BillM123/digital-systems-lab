`timescale 1ns/10ps

module baud_controller_tb;

    reg clk, reset, EN;
    reg [2:0] baud_select;
    wire sample_ENABLE;

    baud_controller baud_controller_bench(reset, clk, baud_select, EN, sample_ENABLE);

    initial begin
        $dumpfile("baud_controller_tb.vcd");
        $dumpvars(0, baud_controller_tb);

        clk = 0;
        reset = 1;
        baud_select = 7;
        EN = 1;

        #5 reset = 1;
        #20 reset = 0;

        #18000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    initial begin
        forever begin
            #3000 baud_select = baud_select - 1;
            #5 reset = 1;
            #20 reset = 0;
        end
    end
endmodule