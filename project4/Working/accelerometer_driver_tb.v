`timescale 1ns / 1ps

module accelerometer_driver_tb;
    reg clk, reset, miso;
    wire cs, mosi, sclk;
    wire TxD;

    accelerometer_driver accelerometer_driver_inst (
        .clk(clk),
        .reset(reset),
        .MISO(miso),
        .CS(cs),
        .MOSI(mosi),
        .SCLK(sclk),
        .TxD(TxD)
    );

    initial begin
        // Initialize Inputs
        // en = 1'b0;
        miso = 1'b1;
        clk = 1'b0;
        reset = 1'b0;
        // driver_data = 8'h00;
        #100 reset = 1'b1;
        #100 reset = 1'b0;
        // #955 miso = 1'b1;
        // #955 driver_data = 8'b0011_1111;
        // #150 en = 1'b1;
        // #50 en = 1'b0;
        // #100 miso = 1'b0;
        // #200 miso = 1'b0;
        // #200 miso = 1'b0;
        // #200 miso = 1'b1;
        // #200 miso = 1'b0; /// problem mosi
        // #200 miso = 1'b1;
        // #200 miso = 1'b0;

        // #1000 en = 1'b1;
        
        

    end 

    always #5 clk = ~clk; // 8 MHz clock period is 125 ns, so half period is 62.5 ns


endmodule