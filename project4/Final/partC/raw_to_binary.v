module raw_to_binary (
    input clk, reset,
    input enable,
    input prepare,
    input filled,
    input signed [7:0] raw,
    output reg [12:0] binary,
    output reg is_negative
);
    //reg [7:0] mem [15:0];
    reg signed [15:0] sum;
    reg signed [7:0] avg;
    reg signed [17:0] binary_wout_res;
    reg signed [12:0] signed_binary; //having this signed is gpt idea so investigate its corectness
    //reg [7:0] dataCount;

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

    //Convert the raw data to binary
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            binary_wout_res <= 0;
            signed_binary <= 0;
            is_negative <= 0;
            binary <= 0;
        end
        else begin
            // Multiply by 1000 using shifts and adds
            // 1000 = 2^9 + 2^8 + 2^7 + 2^6 + 2^5 + 2^3 = 1 1 1 1 1 0 1 0 0 0
            // Changed approach to make cheaper: 1024 - 16 - 8
            if(filled) begin //Meant to keep data stable for transmittion
                binary_wout_res <= (avg <<< 10) - (avg <<< 4) - (avg <<< 3);
            end

            //multiply by resolution (switched order to preserve accuracy)
            signed_binary <= binary_wout_res >>> 6;

            // Handle the sign: store the sign in the 'sign' register
            is_negative <= (signed_binary[12] == 1);

            if (is_negative) 
                binary <= -signed_binary;  // Take the 2's complement to handle negative values
            else
                binary <= signed_binary;   // Use signed binary directly if positive
        end
    end

    
endmodule
