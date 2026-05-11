module baud_controller (reset, clk, baud_select, Tx_EN, sample_ENABLE);
    
    input clk, reset; //clk should be default 100MHz clock on baudrate controller
    input [2:0] baud_select;
    input Tx_EN;
    output reg sample_ENABLE; //active on positive, should remain active for a cycle

    reg [14:0] counter, countMax;

    //Put in separate always to avoid z post-synthesis
    always @(baud_select) begin
        case (baud_select)
            3'b000: countMax = 15'b101000101100001; //20833
            3'b001: countMax = 15'b001010001011000; // 5208
            3'b010: countMax = 15'b000010100010111; // 1303
            3'b011: countMax = 15'b000001010001011; //  651
            3'b100: countMax = 15'b000000101000110; //  326
            3'b101: countMax = 15'b000000010100011; //  163
            3'b110: countMax = 15'b000000001101101; //  109
            3'b111: countMax = 15'b000000000110110; //   54
            default: countMax = 15'b000000000000000;//    0

        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset)begin
            counter <= 0;
            sample_ENABLE <= 0;
        end
        else begin
            //No need to run if transmitter/receiver off
            if(Tx_EN == 0)begin
                counter <= 0; 
                sample_ENABLE <= 0;
            end
            //sample_ENABLE on countMax
            else if(counter == countMax) begin
                counter <= 0;
                sample_ENABLE <= 1;
            end
            else begin
                counter <= counter + 1;
                sample_ENABLE <= 0;
            end
        end
    end

endmodule

/* Sampling Periods For Baud Rate:
 * = 300:    1/(16*300)    = 2.0833333...*10^(-4)
 *           /clk_period   = 20833.333...
 *                         = 15'b101000101100001 
 *
 * = 1200:   1/(16*1200)   = 5.20833333...*10^(-5)
 *           /clk_period   = 5208.33333...
 *                         = 13'b1010001011000
 *
 * = 4800:   1/(16*4800)   = 1.302833333...*10^(-5)
 *           /clk_period   = 1302.833333...
 *                         = 11'b10100010111
 *
 * = 9600:   1/(16*9600)   = 6.5104166666...*10^(-6)
 *           /clk_period   = 651.04166666...
 *                         = 10'b1010001100
 *
 * = 19200:  1/(16*19200)  = 3.25520833333...*10^(-6)
 *           /clk_period   = 325.520833333...
 *                         = 9'b101000110
 *
 * = 38400:  1/(16*38400)  = 1.627604166666...*10^(-6)
 *           /clk_period   = 162.7604166666...
 *                         = 8'b10100011
 *
 * = 57600:  1/(16*57600)  = 1.08506944444...*10^(-6)
 *           /clk_period   = 108.506944444...
 *                         = 7'b1101101
 *
 * = 115200: 1/(16*115200) = 5.42534722222...*10^(-7)
 *           /clk_period   = 54.2534722222...
 *                         = 6'b110110
 *
 * Above period is in seconds
 * Note: 1ns = 10^(-9)s
 *       input clock frequency = 100MHz
 *       ...         period = 10^(-8)
 * Note: decimals are rounded before conversion
 *
**/
