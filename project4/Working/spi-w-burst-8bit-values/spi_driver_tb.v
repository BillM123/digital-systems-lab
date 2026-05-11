`timescale 1ns / 10ps

module accelerometer_driver_tb;

    // Inputs
    reg clk;
    reg reset;
    reg MISO;
    
    // Outputs
    wire MOSI;
    wire SCLK;
    wire CS;
    wire TxD;

    // Instantiate the Unit Under Test (UUT)
    accelerometer_driver accelerometer_driver_inst (
        .clk(clk), 
        .reset(reset), 
        .MISO(MISO), 
        .TxD(TxD),  
        .MOSI(MOSI), 
        .SCLK(SCLK), 
        .CS(CS), 
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Stimulus block
    initial begin
        // Initialize inputs
        reset = 0;
        MISO = 0;

        // Apply reset
        #10;
        reset = 1;
        #10;
        reset = 0;

        // Change MISO value to simulate data reception (shifted bits)
        MISO = 1;  // simulate bit from slave

        // Disable the SPI transfer after some time
        //Fl_En = 0;

        // Finish the simulation after a short time
        #10000000;
        $finish;
    end


endmodule