`timescale 1ns / 10ps

module tb_raw_to_binary;

    // Declare inputs as regs and outputs as wires
    reg clk;
    reg reset;
    reg enable;
    reg prepare;
    reg filled;
    reg [7:0] raw;
    wire [12:0] binary;
    wire is_negative;

    // Instantiate the raw_to_binary module
    raw_to_binary raw_to_binary_tb (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .prepare(prepare),
        .filled(filled),
        .raw(raw),
        .binary(binary),
        .is_negative(is_negative)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    integer i;
    reg [7:0] pos_values [127:0];  // Known positive values
    reg [7:0] neg_values [127:0];  // Known negative values

    initial begin
        // Initialize clock and signals
        clk = 0;
        reset = 0;
        enable = 0;
        prepare = 0;
        raw = 8'd0;
        filled = 1;

        // Initialize the positive values (known average = 8'd50 for example)
        pos_values[0] = 8'd45;
        pos_values[1] = 8'd50;
        pos_values[2] = 8'd51;
        pos_values[3] = 8'd52;
        pos_values[4] = 8'd53;
        pos_values[5] = 8'd54;
        pos_values[6] = 8'd55;
        pos_values[7] = 8'd56;
        pos_values[8] = 8'd57;
        pos_values[9] = 8'd58;
        pos_values[10] = 8'd59;
        pos_values[11] = 8'd60;
        pos_values[12] = 8'd61;
        pos_values[13] = 8'd62;
        pos_values[14] = 8'd63;
        pos_values[15] = 8'd64;
        pos_values[16] = 8'd45;
        pos_values[17] = 8'd50;
        pos_values[18] = 8'd51;
        pos_values[19] = 8'd52;
        pos_values[20] = 8'd53;
        pos_values[21] = 8'd54;
        pos_values[22] = 8'd55;
        pos_values[23] = 8'd56;
        pos_values[24] = 8'd57;
        pos_values[25] = 8'd58;
        pos_values[26] = 8'd59;
        pos_values[27] = 8'd60;
        pos_values[28] = 8'd61;
        pos_values[29] = 8'd62;
        pos_values[30] = 8'd63;
        pos_values[31] = 8'd64;
        pos_values[32] = 8'd45;
        pos_values[33] = 8'd50;
        pos_values[34] = 8'd51;
        pos_values[35] = 8'd52;
        pos_values[36] = 8'd53;
        pos_values[37] = 8'd54;
        pos_values[38] = 8'd55;
        pos_values[39] = 8'd56;
        pos_values[40] = 8'd57;
        pos_values[41] = 8'd58;
        pos_values[42] = 8'd59;
        pos_values[43] = 8'd60;
        pos_values[44] = 8'd61;
        pos_values[45] = 8'd62;
        pos_values[46] = 8'd63;
        pos_values[47] = 8'd64;
        pos_values[48] = 8'd45;
        pos_values[49] = 8'd50;
        pos_values[50] = 8'd51;
        pos_values[51] = 8'd52;
        pos_values[52] = 8'd53;
        pos_values[53] = 8'd54;
        pos_values[54] = 8'd55;
        pos_values[55] = 8'd56;
        pos_values[56] = 8'd57;
        pos_values[57] = 8'd58;
        pos_values[58] = 8'd59;
        pos_values[59] = 8'd60;
        pos_values[60] = 8'd61;
        pos_values[61] = 8'd62;
        pos_values[62] = 8'd63;
        pos_values[63] = 8'd64;
        pos_values[64] = 8'd45;
        pos_values[65] = 8'd50;
        pos_values[66] = 8'd51;
        pos_values[67] = 8'd52;
        pos_values[68] = 8'd53;
        pos_values[69] = 8'd54;
        pos_values[70] = 8'd55;
        pos_values[71] = 8'd56;
        pos_values[72] = 8'd57;
        pos_values[73] = 8'd58;
        pos_values[74] = 8'd59;
        pos_values[75] = 8'd60;
        pos_values[76] = 8'd61;
        pos_values[77] = 8'd62;
        pos_values[78] = 8'd63;
        pos_values[79] = 8'd64;
        pos_values[80] = 8'd45;
        pos_values[81] = 8'd50;
        pos_values[82] = 8'd51;
        pos_values[83] = 8'd52;
        pos_values[84] = 8'd53;
        pos_values[85] = 8'd54;
        pos_values[86] = 8'd55;
        pos_values[87] = 8'd56;
        pos_values[88] = 8'd57;
        pos_values[89] = 8'd58;
        pos_values[90] = 8'd59;
        pos_values[91] = 8'd60;
        pos_values[92] = 8'd61;
        pos_values[93] = 8'd62;
        pos_values[94] = 8'd63;
        pos_values[95] = 8'd64;
        pos_values[96] = 8'd45;
        pos_values[97] = 8'd50;
        pos_values[98] = 8'd51;
        pos_values[99] = 8'd52;
        pos_values[100] = 8'd53;
        pos_values[101] = 8'd54;
        pos_values[102] = 8'd55;
        pos_values[103] = 8'd56;
        pos_values[104] = 8'd57;
        pos_values[105] = 8'd58;
        pos_values[106] = 8'd59;
        pos_values[107] = 8'd60;
        pos_values[108] = 8'd61;
        pos_values[109] = 8'd62;
        pos_values[110] = 8'd63;
        pos_values[111] = 8'd64;
        pos_values[112] = 8'd45;
        pos_values[113] = 8'd50;
        pos_values[114] = 8'd51;
        pos_values[115] = 8'd52;
        pos_values[116] = 8'd53;
        pos_values[117] = 8'd54;
        pos_values[118] = 8'd55;
        pos_values[119] = 8'd56;
        pos_values[120] = 8'd57;
        pos_values[121] = 8'd58;
        pos_values[122] = 8'd59;
        pos_values[123] = 8'd60;
        pos_values[124] = 8'd61;
        pos_values[125] = 8'd62;
        pos_values[126] = 8'd63;
        pos_values[127] = 8'd64;

        // Initialize the negative values (known average = 8'd-50 for example)
        neg_values[0] = -8'd45;
        neg_values[1] = -8'd50;
        neg_values[2] = -8'd51;
        neg_values[3] = -8'd52;
        neg_values[4] = -8'd53;
        neg_values[5] = -8'd54;
        neg_values[6] = -8'd55;
        neg_values[7] = -8'd56;
        neg_values[8] = -8'd57;
        neg_values[9] = -8'd58;
        neg_values[10] = -8'd59;
        neg_values[11] = -8'd60;
        neg_values[12] = -8'd61;
        neg_values[13] = -8'd62;
        neg_values[14] = -8'd63;
        neg_values[15] = -8'd64;
        neg_values[16] = -8'd45;
        neg_values[17] = -8'd50;
        neg_values[18] = -8'd51;
        neg_values[19] = -8'd52;
        neg_values[20] = -8'd53;
        neg_values[21] = -8'd54;
        neg_values[22] = -8'd55;
        neg_values[23] = -8'd56;
        neg_values[24] = -8'd57;
        neg_values[25] = -8'd58;
        neg_values[26] = -8'd59;
        neg_values[27] = -8'd60;
        neg_values[28] = -8'd61;
        neg_values[29] = -8'd62;
        neg_values[30] = -8'd63;
        neg_values[31] = -8'd64;
        neg_values[32] = -8'd45;
        neg_values[33] = -8'd50;
        neg_values[34] = -8'd51;
        neg_values[35] = -8'd52;
        neg_values[36] = -8'd53;
        neg_values[37] = -8'd54;
        neg_values[38] = -8'd55;
        neg_values[39] = -8'd56;
        neg_values[40] = -8'd57;
        neg_values[41] = -8'd58;
        neg_values[42] = -8'd59;
        neg_values[43] = -8'd60;
        neg_values[44] = -8'd61;
        neg_values[45] = -8'd62;
        neg_values[46] = -8'd63;
        neg_values[47] = -8'd64;
        neg_values[48] = -8'd45;
        neg_values[49] = -8'd50;
        neg_values[50] = -8'd51;
        neg_values[51] = -8'd52;
        neg_values[52] = -8'd53;
        neg_values[53] = -8'd54;
        neg_values[54] = -8'd55;
        neg_values[55] = -8'd56;
        neg_values[56] = -8'd57;
        neg_values[57] = -8'd58;
        neg_values[58] = -8'd59;
        neg_values[59] = -8'd60;
        neg_values[60] = -8'd61;
        neg_values[61] = -8'd62;
        neg_values[62] = -8'd63;
        neg_values[63] = -8'd64;
        neg_values[64] = -8'd45;
        neg_values[65] = -8'd50;
        neg_values[66] = -8'd51;
        neg_values[67] = -8'd52;
        neg_values[68] = -8'd53;
        neg_values[69] = -8'd54;
        neg_values[70] = -8'd55;
        neg_values[71] = -8'd56;
        neg_values[72] = -8'd57;
        neg_values[73] = -8'd58;
        neg_values[74] = -8'd59;
        neg_values[75] = -8'd60;
        neg_values[76] = -8'd61;
        neg_values[77] = -8'd62;
        neg_values[78] = -8'd63;
        neg_values[79] = -8'd64;
        neg_values[80] = -8'd45;
        neg_values[81] = -8'd50;
        neg_values[82] = -8'd51;
        neg_values[83] = -8'd52;
        neg_values[84] = -8'd53;
        neg_values[85] = -8'd54;
        neg_values[86] = -8'd55;
        neg_values[87] = -8'd56;
        neg_values[88] = -8'd57;
        neg_values[89] = -8'd58;
        neg_values[90] = -8'd59;
        neg_values[91] = -8'd60;
        neg_values[92] = -8'd61;
        neg_values[93] = -8'd62;
        neg_values[94] = -8'd63;
        neg_values[95] = -8'd64;
        neg_values[96] = -8'd45;
        neg_values[97] = -8'd50;
        neg_values[98] = -8'd51;
        neg_values[99] = -8'd52;
        neg_values[100] = -8'd53;
        neg_values[101] = -8'd54;
        neg_values[102] = -8'd55;
        neg_values[103] = -8'd56;
        neg_values[104] = -8'd57;
        neg_values[105] = -8'd58;
        neg_values[106] = -8'd59;
        neg_values[107] = -8'd60;
        neg_values[108] = -8'd61;
        neg_values[109] = -8'd62;
        neg_values[110] = -8'd63;
        neg_values[111] = -8'd64;
        neg_values[112] = -8'd45;
        neg_values[113] = -8'd50;
        neg_values[114] = -8'd51;
        neg_values[115] = -8'd52;
        neg_values[116] = -8'd53;
        neg_values[117] = -8'd54;
        neg_values[118] = -8'd55;
        neg_values[119] = -8'd56;
        neg_values[120] = -8'd57;
        neg_values[121] = -8'd58;
        neg_values[122] = -8'd59;
        neg_values[123] = -8'd60;
        neg_values[124] = -8'd61;
        neg_values[125] = -8'd62;
        neg_values[126] = -8'd63;
        neg_values[127] = -8'd64;

        // Test with positive values
        $display("Starting Positive Test...");
        reset = 1;
        #10 reset = 0;
        enable = 1;

        // Feed in positive values
        for (i = 0; i < 128; i = i + 1) begin
            raw = pos_values[i];
            #10; // Wait for the output to update
            $display("Input: %d, Binary: %d, is_negative: %b", raw, binary, is_negative);
            enable = 0;
            #30;
            enable = 1;
        end
        enable = 0;
        #100;
        prepare = 1;
        #50;
        prepare = 0;

        #100 enable = 1;
        // Test with negative values
        $display("Starting Negative Test...");
        for (i = 0; i < 128; i = i + 1) begin
            raw = neg_values[i];
            #10; // Wait for the output to update
            $display("Input: %d, Binary: %d, is_negative: %b", raw, binary, is_negative);
            enable = 0;
            #30;
            enable = 1;
        end
        prepare = 0;

        // End simulation
        $finish;
    end
endmodule