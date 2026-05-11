module raw_temp_to_binary (
    input clk, reset,
    input enable,
    input [11:0] raw,
    output reg [16:0] binary,
    output reg is_negative
);
    reg [11:0] mem [31:0];
    reg [15:0] sum; //Caution, used to be 20 bits, 16 should be enough
    reg [11:0] avg;
    reg [11:0] avg_w_res;
    reg signed [16:0] signed_binary; //having this signed is gpt idea so investigate its corectness
    integer i;

    //Calculate the average of 16 past 
    //previous values
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sum <= 16'b0;
            avg <= 8'b0;
        end else begin
            sum <= 16'sd0;  // Reset sum to 0 before calculation
            for (i = 0; i < 32; i = i + 1) begin
                sum <= sum + mem[i];  // Accumulate the sum of all values in the array
            end
            avg <= sum >>> 5;  // Divide by 16 using arithmetic shift
        end
    end

    //Shift the contents of mem by one slot
    //to make room for the new data entered
    always @(posedge clk or posedge reset)begin
        if(reset) begin
            mem[0] <= 0;
            mem[1] <= 0;
            mem[2] <= 0;
            mem[3] <= 0;
            mem[4] <= 0;
            mem[5] <= 0;
            mem[6] <= 0;
            mem[7] <= 0;
            mem[8] <= 0;
            mem[9] <= 0;
            mem[10] <= 0;
            mem[11] <= 0;
            mem[12] <= 0;
            mem[13] <= 0;
            mem[14] <= 0;
            mem[15] <= 0;
            mem[16] <= 0;
            mem[17] <= 0;
            mem[18] <= 0;
            mem[19] <= 0;
            mem[20] <= 0;
            mem[21] <= 0;
            mem[22] <= 0;
            mem[23] <= 0;
            mem[24] <= 0;
            mem[25] <= 0;
            mem[26] <= 0;
            mem[27] <= 0;
            mem[28] <= 0;
            mem[29] <= 0;
            mem[30] <= 0;
            mem[31] <= 0;
        end
        else begin
            if(enable) begin
                mem[0] <= raw;
                mem[1] <= mem[0];
                mem[2] <= mem[1];
                mem[3] <= mem[2];
                mem[4] <= mem[3];
                mem[5] <= mem[4];
                mem[6] <= mem[5];
                mem[7] <= mem[6];
                mem[8] <= mem[7];
                mem[9] <= mem[8];
                mem[10] <= mem[9];
                mem[11] <= mem[10];
                mem[12] <= mem[11];
                mem[13] <= mem[12];
                mem[14] <= mem[13];
                mem[15] <= mem[14];
                mem[16] <= mem[15];
                mem[17] <= mem[16];
                mem[18] <= mem[17];
                mem[19] <= mem[18];
                mem[20] <= mem[19];
                mem[21] <= mem[20];
                mem[22] <= mem[21];
                mem[23] <= mem[22];
                mem[24] <= mem[23];
                mem[25] <= mem[24];
                mem[26] <= mem[25];
                mem[27] <= mem[26];
                mem[28] <= mem[27];
                mem[29] <= mem[28];
                mem[30] <= mem[29];
                mem[31] <= mem[30];
            end
        end
    end

    //multiply by 0.065 (about equal to 1/16 + 1/256 - 1/512 (0.064453...))
    always @(avg) begin
        avg_w_res = /*(avg >>> 4)*/ + (avg >>> 8) - (avg >>> 9);
    end

    //Convert the raw data to binary
    always@(avg_w_res) begin
        // Multiply by 1000 using shifts and adds
        // 1000 = 2^9 + 2^8 + 2^7 + 2^6 + 2^5 + 2^3 = 1 1 1 1 1 0 1 0 0 0
        signed_binary =(avg_w_res <<< 10) /*- (avg_w_res << 4)*/ + (avg_w_res <<< 3); 
    
        // Handle the sign: store the sign in the 'sign' register
        is_negative = (signed_binary[11] == 1); // if MSB of 'a' is 1, the number is negative

        // Work with the absolute value of 'a' for multiplication
        if (is_negative) 
            binary = -signed_binary;  // Take the 2's complement to handle negative values
        else
            binary = signed_binary;   // Use 'a' directly if positive
    end

    
endmodule