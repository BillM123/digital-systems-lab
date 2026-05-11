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
        miso = 1'b1;
        clk = 1'b0;
        reset = 1'b0;
        #100 reset = 1'b1;
        #100 reset = 1'b0;


        
        

    end 

    always #5 clk = ~clk;


endmodule
