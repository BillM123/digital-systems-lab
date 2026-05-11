`timescale 1ns/10ps

module uart_transmitter_tb;

    reg clk, reset;
    reg [2:0] baud_select;
    reg [7:0] Tx_DATA;
    reg Tx_EN, Tx_WR;
    wire TxD, Tx_BUSY;

    uart_transmitter uart_transmitter_bench(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);

    initial begin
        $dumpfile("uart_transmitter_tb.vcd");
        $dumpvars(0, uart_transmitter_tb);

        clk = 0;
        reset = 1;
        baud_select = 7; //should allow for most extensive testing
        Tx_EN = 0;
        Tx_WR = 0;
        Tx_DATA = 0;

        #5 reset = 1;
        #100 reset = 0;
        #5 Tx_EN = 1;

        #20 Tx_DATA = 8'b10101010;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 Tx_DATA = 8'b01010101;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;
        
        #150000 Tx_EN = 0;
        #10 Tx_DATA = 8'b01010111;//This should not be "transmitted"
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;
        #10 Tx_EN = 1;

        #150000 Tx_DATA = 8'b11001100;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 Tx_DATA = 8'b10001001;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule