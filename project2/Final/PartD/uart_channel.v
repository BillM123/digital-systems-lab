module uart_channel(clk, reset, Tx_DATA, baud_select, Tx_EN, Rx_EN, Tx_WR,
                    Rx_DATA, Tx_BUSY, Rx_PERROR, Rx_FERROR, Rx_VALID);
    input clk, reset;

    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    input Tx_EN, Rx_EN, Tx_WR;

    output [7:0] Rx_DATA;
    output Tx_BUSY, Rx_PERROR, Rx_FERROR, Rx_VALID;
    
    wire D; //means of communication between transmitter and receiver

    uart_transmitter transmitter_instance(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, D, Tx_BUSY);
    uart_receiver receiver_instance(reset, clk, Rx_DATA, baud_select, Rx_EN, D, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
endmodule
