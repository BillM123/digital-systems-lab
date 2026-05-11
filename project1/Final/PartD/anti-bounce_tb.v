`timescale 1ns/10ps

module antibounce_tb;
    reg buttonIn, clk;
    wire buttonOut;

    antibounce antibounce_bench(buttonIn, clk, buttonOut);

    initial begin
        $dumpfile("antibounce_tb.vcd");
        $dumpvars(0, antibounce_tb);

        clk = 0;

        #10 buttonIn = 1;
        #25 buttonIn = 0;

        #500 buttonIn = 1;
        #750 buttonIn = 0;

        #150 buttonIn = 1;
        #25 buttonIn = 0;

        #250 buttonIn = 1;
        #200 buttonIn = 0;

        #10 buttonIn = 1;
        #10 buttonIn = 0;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
endmodule