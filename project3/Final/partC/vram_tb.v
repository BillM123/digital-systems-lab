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
        #1000  address = 14'b00000000000011;
        #1000  address = 14'b00000000000100;
        #1000  address = 14'b00000000000101;
        #1000  address = 14'b00000000000110;
        #1000  address = 14'b00000000000111;
        #1000  address = 14'b00000000001000;
        #1000  address = 14'b00000000001001;
        #1000  address = 14'b00000000001010;
        #1000  address = 14'b00000000001011;
        #1000  address = 14'b00000000001100;
        #1000  address = 14'b00000000001101;
        #1000  address = 14'b00000000001110;
        #1000  address = 14'b00000000001111;
        #1000  address = 14'b00000000010000;
        #1000  address = 14'b00000000010001;
        #1000  address = 14'b00000000010010;
        #1000  address = 14'b00000000010011;
        #1000  address = 14'b00000000010100;
        #1000  address = 14'b00000000010101;
        #1000  address = 14'b00000000010110;
        #1000  address = 14'b00000000010111;
        #1000  address = 14'b00000000011000;
        #1000  address = 14'b00000000011001;
        #1000  address = 14'b00000000011010;
        #1000  address = 14'b00000000011011;
        #1000  address = 14'b00000000011100;
        #1000  address = 14'b00000000011101;
        #1000  address = 14'b00000000011110;
        #1000  address = 14'b00000000011111;
        //#2000  address = 14'b00000000010001;
        //#1000  address = 14'b00000000010010;
        //#1000  address = 14'b00000000010011;
        //#1000  address = 14'b00000000010100;
        //#1000  address = 14'b00000000010101;
        //#1000  address = 14'b00000000011111;
        //#1000  address = 14'b00000000100001;
        //#1000  address = 14'b00000000100010;
        //#1000  address = 14'b00000000100011;
        //#1000  address = 14'b00000000100100;
        //#1000  address = 14'b00000000100101;
        //#1000  address = 14'b00000000101111;
        //#1000  address = 14'b00000000110001;
        //#1000  address = 14'b00000000110010;
        //#1000  address = 14'b00000000110011;
        //#1000  address = 14'b00000000110100;
        //#1000  address = 14'b00000000110101;
        //#1000  address = 14'b00000000111111;
        //#1000  address = 14'b00000001000001;
        //#1000  address = 14'b00000001000010;
        //#1000  address = 14'b00000001000011;
        //#1000  address = 14'b00000001000100;
        //#1000  address = 14'b00000001000101;
        //#1000  address = 14'b00000001001111;
        //#1000  address = 14'b00000001010001;
        //#1000  address = 14'b00000001010010;
        //#1000  address = 14'b00000001010011;
        //#1000  address = 14'b00000001010100;
        //#1000  address = 14'b00000001010101;
        //#1000  address = 14'b00000001011111;

        //#10000 address = 14'b00000000001111; //00 last block

        //#10000 address = 14'b00001000000111; //05 4th block not

        //#10000 address = 14'b00000011011101; //random

        #1000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule