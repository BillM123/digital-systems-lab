module binary_to_ascii(
    input [16:0] bin,
    output reg [47:0] ascii
);
   
    integer i;
    reg [23:0] bcd;
    
    always @(bin) begin
        bcd=0;		 	
        for (i=0;i<17;i=i+1) begin					//Iterate once for each bit in input number

            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
    	    if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
    	    if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
    	    if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
            if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
            if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
    
            bcd = {bcd[22:0],bin[16-i]};				//Shift one bit, and shift in proper bit from input 
        end
    end
        //converts bcd to ascii
    always @(bcd) begin
        // Convert each BCD digit to ASCII by adding 8'd48 ('0' in ascii)
        ascii[47:40] = bcd[23:20] + 8'd48;  // Most significant BCD digit
        ascii[39:32] = bcd[19:16] + 8'd48;
        ascii[31:24] = bcd[15:12] + 8'd48;
        ascii[23:16] = bcd[11:8]  + 8'd48;
        ascii[15:8]  = bcd[7:4]   + 8'd48;
        ascii[7:0]   = bcd[3:0]   + 8'd48;  // Least significant BCD digit
    end
endmodule