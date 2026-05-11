`timescale 1ns / 10ps

module spi_tb;

    // Inputs
    reg clk;
    reg reset;
    reg MISO;
    reg [7:0] newData;
    reg Fl_En;

    // Outputs
    wire MOSI;
    wire SCLK;
    wire CS;
    wire [7:0] data;
    wire Fl_Ready;
    wire Fl_End;
    wire Fl_Stop;

    // Instantiate the Unit Under Test (UUT)
    spi_a spi_tb (
        .clk(clk), 
        .reset(reset), 
        .MISO(MISO), 
        .newData(newData), 
        .Fl_En(Fl_En), 
        .MOSI(MOSI), 
        .SCLK(SCLK), 
        .CS(CS), 
        .data(data), 
        .Fl_Ready(Fl_Ready),
        .Fl_End(Fl_End), 
        .Fl_Stop(Fl_Stop)
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
        newData = 8'b10101010;
        Fl_En = 0;

        // Apply reset
        #10;
        reset = 1;
        #10;
        reset = 0;

        // Enable the SPI transfer
        #10;
        Fl_En = 1;
        
        // Wait for some time, simulate sending data and monitor signals
        #100;

        // Change MISO value to simulate data reception (shifted bits)
        MISO = 1;  // simulate bit from slave
        #10;
        MISO = 0;  // simulate next bit
        #10;
        MISO = 1;  // and so on...
        #10;
        
        #100000 Fl_En = 0;
        #1000 Fl_En = 1;

        // Disable the SPI transfer after some time
        //Fl_En = 0;

        // Finish the simulation after a short time
        #10000000;
        $finish;
    end


endmodule