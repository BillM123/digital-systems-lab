`timescale 1ns/10ps

module uart_receiver_tb;

    reg clk, reset;
    reg [2:0] baud_select;
    reg Rx_EN, RxD;

    wire [7:0] Rx_DATA;
    wire Rx_FERROR, Rx_PERROR, Rx_VALID;

    uart_receiver uart_receiver_bench(reset, clk, Rx_DATA, baud_select, Rx_EN, RxD, Rx_FERROR, Rx_PERROR, Rx_VALID);

    initial begin
        $dumpfile("uart_receiver_tb.vcd");
        $dumpvars(0, uart_receiver_tb);

        clk = 0;
        reset = 1;
        baud_select = 7; //should allow for most extensive testing
        Rx_EN = 0;
        

        #5 reset = 1;
        #20 reset = 0;
        #5 Rx_EN = 1;

        #20 RxD = 0; //start bit

        #8640 RxD = 1; //54(baud max clock)*16(sample enable count)*10(clk period)
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;

        #8640 RxD = 0; //parity
        #8640 RxD = 1; //stop
        #8640 RxD = 1;

        

        #150000 RxD = 0; //start bit

        #8640 RxD = 0; //54(baud max clock)*16(sample enable count)*10(clk period)
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;

        #8640 RxD = 0; //parity
        #8640 RxD = 1; //stop
        #8640 RxD = 1;
        
        #10 Rx_EN = 0;
        //This should not be received
        #150000 RxD = 0; //start bit

        #8640 RxD = 0; //54(baud max clock)*16(sample enable count)*10(clk period)
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 1;

        #8640 RxD = 0; //parity
        #8640 RxD = 1; //stop
        #8640 RxD = 1;
        
        #10 Rx_EN = 1;

        //parity error
        #150000 RxD = 0; //start bit

        #8640 RxD = 1; //54(baud max clock)*16(sample enable count)*10(clk period)
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 0;
        #8640 RxD = 1;
        #8640 RxD = 1;
        #8640 RxD = 0;
        #8640 RxD = 0;

        #8640 RxD = 1; //parity
        #8640 RxD = 1; //stop
        #8640 RxD = 1;

        //framing error
        #150000 RxD = 0; //start bit

        #40 RxD = 1; //54(baud max clock)*16(sample enable count)*10(clk period)
        #40 RxD = 1;
        #40 RxD = 0;
        #40 RxD = 0;
        #40 RxD = 1;
        #40 RxD = 1;
        #40 RxD = 0;
        #40 RxD = 0;

        #40 RxD = 1; //parity
        #40 RxD = 1; //stop
        #40 RxD = 1;

        #150000 $finish;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    
endmodule