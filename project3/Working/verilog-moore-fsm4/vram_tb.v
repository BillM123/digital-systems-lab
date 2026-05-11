`timescale 1ns/10ps

module vram_tb;

    reg clk, reset;
    reg [13:0] address;
    wire red, green, blue;

    vram vram_inst(clk, reset, address, red, green, blue);

    initial begin
        $dumpfile("vram_tb.vcd");
        $dumpvars(0, vram_tb);

        clk = 0;
        reset = 1;
        address = 14'b00000000000000;

        #5 reset = 1;
        #20 reset = 0;

        #1000  address = 14'b00000000000001;
        #1000  address = 14'b00000000000010;

        #10000 address = 14'b00000000001111; //00 last block

        #10000 address = 14'b00000001010011; //05 4th block

        #10000 address = 14'b00000011011101; //random

        #18000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule