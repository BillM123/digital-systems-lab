module binary_to_ascii (binary, ascii);

    input [19:0] binary; //mbe 17 bits
    output reg [47:0] ascii;

    integer i;
    reg [43:0] shift_reg;     // Shift register to hold intermediate results
    reg [23:0] bcd;

    //converts binary to bcd
    always @(*) begin
        // Initialize the shift register with the binary input and clear BCD positions
        shift_reg = {12'd0, binary};

        // Perform the double dabble algorithm
        for (i = 0; i < 20; i = i + 1) begin
            // Check each BCD digit and add 3 if greater than or equal to 5
            if (shift_reg[43:40] >= 5)
                shift_reg[43:40] = shift_reg[43:40] + 3;
            if (shift_reg[39:36] >= 5)
                shift_reg[39:36] = shift_reg[39:36] + 3;
            if (shift_reg[35:32] >= 5)
                shift_reg[35:32] = shift_reg[35:32] + 3;
            if (shift_reg[31:28] >= 5)
                shift_reg[31:28] = shift_reg[31:28] + 3;
            if (shift_reg[27:24] >= 5)
                shift_reg[27:24] = shift_reg[27:24] + 3;
            if (shift_reg[23:20] >= 5)
                shift_reg[23:20] = shift_reg[23:20] + 3;

            // Shift left to bring in the next binary bit
            shift_reg = shift_reg << 1;
        end

        // Assign the converted BCD to the output
        bcd = shift_reg[19:8];
    end

    //converts bcd to ascii
    always @(*) begin
        // Convert each BCD digit to ASCII by adding 8'd48 ('0' in ascii)
        ascii[47:40] = bcd[23:20] + 8'd48;  // Most significant BCD digit
        ascii[39:32] = bcd[19:16] + 8'd48;
        ascii[31:24] = bcd[15:12] + 8'd48;
        ascii[23:16] = bcd[11:8]  + 8'd48;
        ascii[15:8]  = bcd[7:4]   + 8'd48;
        ascii[7:0]   = bcd[3:0]   + 8'd48;  // Least significant BCD digit
    end
endmodule

