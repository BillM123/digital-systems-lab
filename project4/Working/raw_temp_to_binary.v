module raw_temp_to_binary (
    input clk, reset,
    input enable,
    input prepare,
    input filled,
    input signed [11:0] raw,
    output reg [16:0] binary,
    output reg is_negative
);
    // reg [11:0] mem [15:0];
    reg signed [19:0] sum; //Caution, used to be 20 bits, 16 should be enough
    reg signed [11:0] avg;
    reg signed [22:0] binary_wout_res;
    reg signed [16:0] signed_binary; //having this signed is gpt idea so investigate its corectness
    //integer i;

    //Calculate the average of 128 
    //previous values
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sum <= 16'b0;
            avg <= 8'b0;
        end else begin
            if(prepare) begin
                sum <= 16'b0;
                avg <= 8'b0;
            end
            else if(enable) begin
                sum <= sum + raw;  // Accumulate the sum of all values in the array
                avg <= sum >>> 7;  // Divide by 128 (i think) using arithmetic shift
            end            
        end
    end

    //multiply by 0.065 (about equal to 1/16 + 1/256 - 1/512 (0.064453...))
    // always @(avg) begin
    //     avg_w_res = /*(avg >>> 4)*/ + (avg >>> 8) - (avg >>> 9);
    // end

    //Convert the raw data to binary
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            binary_wout_res <= 0;
            signed_binary <= 0;
            is_negative <= 0;
            binary <= 0;
        end else begin
            // Multiply by 1000 using shifts and adds
            // 1000 = 2^9 + 2^8 + 2^7 + 2^6 + 2^5 + 2^3 = 1 1 1 1 1 0 1 0 0 0
            if(filled) begin //Meant to keep data stable for transmittion
                binary_wout_res <= (avg <<< 10) - (avg <<< 4) + (avg <<< 3); 
            end

            signed_binary <= (binary_wout_res >>> 4) + (binary_wout_res >>> 8) - (binary_wout_res >>> 9);

            // Handle the sign: store the sign in the 'sign' register
            is_negative <= (signed_binary[16] == 1); // if MSB of 'a' is 1, the number is negative

            if (is_negative) 
                binary <= -signed_binary;  // Take the 2's complement to handle negative values
            else
                binary <= signed_binary;   // Use signed binary directly if positive
        end
    end

    
endmodule