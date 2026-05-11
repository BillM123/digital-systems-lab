`timescale 1ns/10ps

module uart_channel_tb;
    
    reg clk, reset;
    reg [7:0] DataIn;
    reg [2:0] baud_select;
    reg Tx_EN, Rx_EN, Tx_WR;

    wire [7:0] DataOut;
    wire Tx_BUSY, Rx_PERROR, Rx_FERROR, Rx_VALID;

    uart_channel uart_channel_bench(clk, reset, DataIn, baud_select, Tx_EN, Rx_EN, Tx_WR,
                                    DataOut, Tx_BUSY, Rx_PERROR, Rx_FERROR, Rx_VALID);

    initial begin
        $dumpfile("uart_channel_tb.vcd");
        $dumpvars(0, uart_channel_tb);

        clk = 0;
        reset = 1;
        Tx_EN = 0;
        Rx_EN = 0;
        Tx_WR = 0;
        baud_select = 7;
        DataIn = 8'b0;

        #1000 reset = 0;

        #10 Tx_EN = 1;
        #10 Rx_EN = 1;

        #20 DataIn = 8'b10101010;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 DataIn = 8'b01010101;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 Tx_EN = 0;
        #10 DataIn = 8'b01010110;//This should not be "transmitted"
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;
        #10 Tx_EN = 1;

        #150000 Rx_EN = 0;
        #10 DataIn = 8'b01010111;//This should not be "received"
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 Rx_EN = 1;
        #10 DataIn = 8'b11001100;
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;

        #150000 DataIn = 8'b10001001;
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
