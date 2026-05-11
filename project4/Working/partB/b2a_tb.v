`timescale 1ns/10ps

module tb_bin2ascii;

    reg [16:0] bin;         // Binary input to the module
    wire [47:0] ascii;      // ASCII output from the module

    // Instantiate the bin2ascii module
    binary_to_ascii uut (
        .bin(bin),
        .ascii(ascii)
    );

    // Task to display results in a readable format
    task display_results;
        input [16:0] binary_input;
        input [47:0] ascii_output;
        integer i;
        reg [7:0] ascii_char;
        begin
            // Display Binary Input
            $write("Binary: %d, ASCII: ", binary_input);

            // Display ASCII Output
            for (i = 47; i >= 0; i = i - 8) begin
                ascii_char = ascii_output[i -: 8];
                $write("%c", ascii_char);
            end

            $write("\n");
        end
    endtask

    initial begin
        // Apply test cases
        $display("Testing bin2ascii...");

        bin = 17'd0; #10;
        display_results(bin, ascii);

        bin = 17'd1; #10;
        display_results(bin, ascii);

        bin = 17'd9; #10;
        display_results(bin, ascii);

        bin = 17'd10; #10;
        display_results(bin, ascii);

        bin = 17'd99; #10;
        display_results(bin, ascii);

        bin = 17'd1234; #10;
        display_results(bin, ascii);

        bin = 17'd99999; #10; // Large value test
        display_results(bin, ascii);

        bin = 17'd131072; #10; // Maximum 17-bit value
        display_results(bin, ascii);

        // End simulation
        $display("Test completed.");
        $finish;
    end
endmodule
