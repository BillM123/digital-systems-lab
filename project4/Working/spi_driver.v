module spi_driver (
    input clk, reset, MISO,
    output reg data_ready_for_printing,
    output [7:0] ascii_X1, ascii_X2, ascii_X3, ascii_X4,    
    output [7:0] ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4,    
    output [7:0] ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4,
    output [7:0] ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6,
    output is_negative_X, is_negative_Y, is_negative_Z, is_negative_T,
    output MOSI, SCLK, CS
);

    reg [5:0] state, nextState;
    reg [7:0] raw_X, raw_Y, raw_Z;
    reg [11:0] raw_T;
    reg softRstWaitEn;
    reg [15:0] softRstWaitTimer;
    reg convert_to_ascii;

    wire [12:0] binary_X, binary_Y, binary_Z;
    wire [16:0] binary_T;
    wire [16:0] padded_binary_X, padded_binary_Y, padded_binary_Z;

    wire [47:0] ascii_X, ascii_Y, ascii_Z, ascii_T;

    reg sample_raw_x;   
    reg sample_raw_y;     
    reg sample_raw_z;     
    reg sample_raw_t_part_l; 
    reg sample_raw_t_part_h; 

    reg [7:0] dataCount;
    reg filled;

    reg dataWaitEn;
    reg [2:0] dataWaitTimer;

    //SPI PORTS:
    // Inputs
    //reg clk;
    //reg reset;
    //reg MISO;
    reg [7:0] newData;
    reg Fl_Enable;

    // Outputs
    //wire MOSI;
    //wire SCLK;
    //wire CS;
    wire [7:0] spiData;
    wire Fl_Ready;
    wire Fl_End;
    wire Fl_Stop;

    parameter [7:0] ACCEL_INSTR_RD = 8'h0B,
                    ACCEL_INSTR_WR = 8'h0A,
                    ACCEL_INSTR_FIFO = 8'h0D,
    
                    ACCEL_REG_XDATA = 8'h08,
                    ACCEL_REG_YDATA = 8'h09,
                    ACCEL_REG_ZDATA = 8'h0A,
    
                    ACCEL_REG_XDATA_L = 8'h0E,
                    ACCEL_REG_XDATA_H = 8'h0F,
                    ACCEL_REG_YDATA_L = 8'h10,
                    ACCEL_REG_YDATA_H = 8'h11,
                    ACCEL_REG_ZDATA_L = 8'h12,
                    ACCEL_REG_ZDATA_H = 8'h13,
                    ACCEL_REG_TEMP_L = 8'h14,
                    ACCEL_REG_TEMP_H = 8'h15,
    
                    ACCEL_REG_SOFT_RESET = 8'h1F,
                    ACCEL_REG_FILTER_CTL = 8'h2C,
                    ACCEL_REG_POWER_CTL = 8'h2D,
                    ACCEL_REG_FIFO_CTL = 8'h28,
    
                    ACCEL_CONF_MEASURE_EN = 8'b00000010,
                    ACCEL_CONF_FILTER_PARAM_SET = 8'b00010100,
                    ACCEL_CONF_RST_REG_CLEAR = 8'h52,
                    ACCEL_CONF_FIFO_SETTINGS = 8'b00001101;

    parameter [5:0] IDLE = 0,
                    //set reset command to accel
                    //no prepare state because cs 0 from idle
                    SOFT_RESET_INSTR = 1, //write
                    SOFT_RESET_REG = 2,
                    SOFT_RESET_DATA = 3,
                    SOFT_RESET_COOLOFF = 4,

                    //send power command with apropriate value
                    POWER_CTL_CONF_PREP = 5, 
                    POWER_CTL_CONF_INSTR = 6, //write
                    POWER_CTL_CONF_REG = 7,
                    POWER_CTL_CONF_DATA = 8,
                    POWER_CTL_CONF_COOLOFF = 9,
                    
                    FILTER_CTL_CONF_PREP = 10,
                    FILTER_CTL_CONF_INSTR = 11, //write
                    FILTER_CTL_CONF_REG = 12,
                    FILTER_CTL_CONF_DATA = 13,
                    FILTER_CTL_CONF_COOLOFF = 14,

                    //prepare to read data via burst read
                    XDATA_PREP = 15,
                    XDATA_INSTR = 16, //read
                    XDATA_REG = 17,
                    //read data via burst read
                    XDATA_DATA = 18,
                    XDATA_SAMPLE = 19,
                    YDATA_DATA = 20,
                    YDATA_SAMPLE = 21,
                    ZDATA_DATA = 22,
                    ZDATA_SAMPLE = 23,
                    TEMP_PREP = 24,
                    TEMP_INSTR = 25,
                    TEMP_REG = 26,
                    TEMP_L_DATA = 27,
                    TEMP_L_SAMPLE = 38,
                    TEMP_H_DATA = 39,
                    TEMP_H_SAMPLE = 30,

                    //prepare and transmit data
                    CONVERT_RAW_TO_ASCII = 31,
                    WAIT_FOR_RD = 32,
                    ENABLE_UART_TRANSMITTION = 33,
                    
                    STOP = 34;
                    
    parameter [7:0] MAX_DATA = 127;

    spi_a spi_inst(
        .clk(clk), 
        .reset(reset), 
        .MISO(MISO), 
        .newData(newData), 
        .Fl_En(Fl_Enable), 
        .MOSI(MOSI), 
        .SCLK(SCLK), 
        .CS(CS), 
        .data(spiData), 
        .Fl_Ready(Fl_Ready),
        .Fl_End(Fl_End), 
        .Fl_Stop(Fl_Stop)
    );

    //Conert all raw data to binary
    raw_to_binary raw_to_binary_X(
        .clk(clk), .reset(reset),
        .enable(convert_to_ascii),
        .filled(filled),
        .prepare(data_ready_for_printing),
        .raw(raw_X),
        .binary(binary_X),
        .is_negative(is_negative_X)
    );
    assign padded_binary_X = {4'b0000, binary_X}; 

    raw_to_binary raw_to_binary_Y(
        .clk(clk), .reset(reset),
        .enable(convert_to_ascii),
        .filled(filled),
        .prepare(data_ready_for_printing),
        .raw(raw_Y),
        .binary(binary_Y),
        .is_negative(is_negative_Y)
    );
    assign padded_binary_Y = {4'b0000, binary_Y};

    raw_to_binary raw_to_binary_Z(
        .clk(clk), .reset(reset),
        .enable(convert_to_ascii),
        .filled(filled),
        .prepare(data_ready_for_printing),
        .raw(raw_Z),
        .binary(binary_Z),
        .is_negative(is_negative_Z)
    );
    assign padded_binary_Z = {4'b0000, binary_Z};

    raw_temp_to_binary raw_temp_to_binary_T(
        .clk(clk), .reset(reset),
        .enable(convert_to_ascii),
        .filled(filled),
        .prepare(data_ready_for_printing),
        .raw(raw_T),
        .binary(binary_T),
        .is_negative(is_negative_T)
    );

    //Convert binary data to ascii
    binary_to_ascii binary_to_ascii_X(
        .bin(padded_binary_X),
        .ascii(ascii_X)
    );
    assign ascii_X1 = ascii_X[31:24]; //assumes most significant bit is sent first
    assign ascii_X2 = ascii_X[23:16];    
    assign ascii_X3 = ascii_X[15:8];
    assign ascii_X4 = ascii_X[7:0];

    binary_to_ascii binary_to_ascii_Y(
        .bin(padded_binary_Y),
        .ascii(ascii_Y)
    );
    assign ascii_Y1 = ascii_Y[31:24]; //assumes most significant bit is sent first
    assign ascii_Y2 = ascii_Y[23:16];    
    assign ascii_Y3 = ascii_Y[15:8];
    assign ascii_Y4 = ascii_Y[7:0];

    binary_to_ascii binary_to_ascii_Z(
        .bin(padded_binary_Z),
        .ascii(ascii_Z)
    );
    assign ascii_Z1 = ascii_Z[31:24]; //assumes most significant bit is sent first
    assign ascii_Z2 = ascii_Z[23:16];    
    assign ascii_Z3 = ascii_Z[15:8];
    assign ascii_Z4 = ascii_Z[7:0];

    binary_to_ascii binary_to_ascii_T(
        .bin(binary_T),
        .ascii(ascii_T)
    );

    assign ascii_T1 = ascii_T[47:40]; //assumes most significant bit is sent first
    assign ascii_T2 = ascii_T[39:32];    
    assign ascii_T3 = ascii_T[31:24];
    assign ascii_T4 = ascii_T[23:16];
    assign ascii_T5 = ascii_T[15:8];
    assign ascii_T6 = ascii_T[7:0]; 

    //This will hopefully keep the data stable for the transmittion
    // always @(posedge clk or posedge reset) begin
    //     if(reset) begin
    //         ascii_X1 <= 0;
    //         ascii_X2 <= 0;
    //         ascii_X3 <= 0;
    //         ascii_X4 <= 0;            

    //         ascii_Y1 <= 0;
    //         ascii_Y2 <= 0;
    //         ascii_Y3 <= 0;
    //         ascii_Y4 <= 0;

    //         ascii_Z1 <= 0;
    //         ascii_Z2 <= 0;
    //         ascii_Z3 <= 0;
    //         ascii_Z4 <= 0;

    //         ascii_T1 <= 0;
    //         ascii_T2 <= 0;
    //         ascii_T3 <= 0;
    //         ascii_T4 <= 0;
    //         ascii_T5 <= 0;
    //         ascii_T6 <= 0; 
    //     end
    //     else if (filled) begin
    //         ascii_X1 <= ascii_X[31:24];
    //         ascii_X2 <= ascii_X[23:16];
    //         ascii_X3 <= ascii_X[15:8];
    //         ascii_X4 <= ascii_X[7:0];            

    //         ascii_Y1 <= ascii_Y[31:24];
    //         ascii_Y2 <= ascii_Y[23:16];
    //         ascii_Y3 <= ascii_Y[15:8];
    //         ascii_Y4 <= ascii_Y[7:0];

    //         ascii_Z1 <= ascii_Z[31:24];
    //         ascii_Z2 <= ascii_Z[23:16];
    //         ascii_Z3 <= ascii_Z[15:8];
    //         ascii_Z4 <= ascii_Z[7:0];

    //         ascii_T1 <= ascii_T[47:40];
    //         ascii_T2 <= ascii_T[39:32];
    //         ascii_T3 <= ascii_T[31:24];
    //         ascii_T4 <= ascii_T[23:16];
    //         ascii_T5 <= ascii_T[15:8];
    //         ascii_T6 <= ascii_T[7:0]; 
    //     end
    // end

    //soft reset timer
    //-> We need to wait for 0.5ms (50000*10 ns) for
    //   soft reset to finish
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            softRstWaitTimer <= 0;
        end
        else begin
            if(softRstWaitEn)begin
                if(softRstWaitTimer != 50000) begin //0.5ms aproximately
                    softRstWaitTimer <= softRstWaitTimer + 1;
                end
                //maybe add signal for done
            end
            else begin
                softRstWaitTimer <= 0;
            end
        end
    end

    //Data conversion takes 3-4 cycles to avoid timing violations
    //So this will hold the state before data transmittion for some time
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            dataWaitTimer <= 0;
        end
        else begin
            if(dataWaitEn)begin
                if(dataWaitTimer != 5) begin //0.5ms aproximately
                    dataWaitTimer <= dataWaitTimer + 1;
                end
            end
            else begin
                dataWaitTimer <= 0;
            end
        end
    end

    //Counter for data added to sum in raw_to_binary modules
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            dataCount <= 0;
            filled <= 0;
        end else begin
            if(convert_to_ascii) begin
                dataCount <= dataCount + 1;
                if(dataCount == MAX_DATA) begin
                    filled <= 1;
                end
            end
            else if(data_ready_for_printing) begin
                dataCount <= 0;
                filled <= 0;
            end
        end
    end

    //Save the raw values to their designated registers
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            raw_X = 0;
            raw_Y = 0;
            raw_Z = 0;
            raw_T = 0;
        end else begin
            if (sample_raw_x) begin
                raw_X = spiData;
            end
            else if (sample_raw_y) begin
                raw_Y = spiData;
            end
            else if (sample_raw_z) begin
                raw_Z = spiData;
            end
            else if (sample_raw_t_part_l) begin
                raw_T = {raw_T[11:8], spiData};
            end
            else if (sample_raw_t_part_h) begin
                raw_T = {spiData[3:0], raw_T[7:0]};
            end
        end
    end


    //fsm: sequential
    always @(posedge clk or posedge reset)begin
        if(reset) begin
            state <= IDLE;
        end
        else begin
            state <= nextState;
        end
    end

    //fsm:combinational
    always @(state or Fl_End or Fl_Stop or softRstWaitTimer or filled or dataWaitTimer) begin
        newData = 0;
        Fl_Enable = 0;
        softRstWaitEn = 0;
        dataWaitEn = 0;
        data_ready_for_printing = 0;
        convert_to_ascii = 0;
        sample_raw_x = 0;
        sample_raw_y = 0;
        sample_raw_z = 0;
        sample_raw_t_part_l = 0;
        sample_raw_t_part_h = 0;

        case(state)
            IDLE: begin
                nextState = SOFT_RESET_INSTR;
            end
            SOFT_RESET_INSTR: begin
                newData = ACCEL_INSTR_WR;
                Fl_Enable = 1;

                if(Fl_End) nextState = SOFT_RESET_REG;
                else nextState = state;                
            end
            SOFT_RESET_REG: begin
                newData = ACCEL_REG_SOFT_RESET;
                Fl_Enable = 1;

                if(Fl_End) nextState = SOFT_RESET_DATA;
                else nextState = state;
            end
            SOFT_RESET_DATA: begin
                newData = ACCEL_CONF_RST_REG_CLEAR;
                Fl_Enable = 1;

                if(Fl_End) nextState = SOFT_RESET_COOLOFF; //NOTE!! CS SHOULD BE HIGH FOR SOME TIME AFTER POSEDGE
                else nextState = state;                     //Next state could hold Fl_Enable until !Fl_End before prep
            end
            SOFT_RESET_COOLOFF: begin
                Fl_Enable = 1;

                if(!Fl_End) nextState = POWER_CTL_CONF_PREP; 
                else nextState = state;
            end

            POWER_CTL_CONF_PREP: begin
                Fl_Enable = 0;
                softRstWaitEn = 1; //wait for soft reset to finish

                if(softRstWaitTimer == 50000) nextState = POWER_CTL_CONF_INSTR;
                else nextState = state;
            end
            POWER_CTL_CONF_INSTR: begin
                newData = ACCEL_INSTR_WR;
                Fl_Enable = 1;

                if(Fl_End) nextState = POWER_CTL_CONF_REG;
                else nextState = state;
            end
            POWER_CTL_CONF_REG: begin
                newData = ACCEL_REG_POWER_CTL;
                Fl_Enable = 1;

                if(Fl_End) nextState = POWER_CTL_CONF_DATA;
                else nextState = state;
            end
            POWER_CTL_CONF_DATA: begin
                newData = ACCEL_CONF_MEASURE_EN;
                Fl_Enable = 1;

                if(Fl_End) nextState = POWER_CTL_CONF_COOLOFF; //NOTE!! CS SHOULD BE HIGH FOR SOME TIME AFTER POSEDGE
                else nextState = state;                      //Next state could hold Fl_Enable until !Fl_End before prep
            end   
            POWER_CTL_CONF_COOLOFF: begin
                Fl_Enable = 1;

                if(!Fl_End) nextState = FILTER_CTL_CONF_PREP;
                else nextState = state;
            end                                           

            FILTER_CTL_CONF_PREP: begin
                Fl_Enable = 0;

                if(!Fl_Stop) nextState = FILTER_CTL_CONF_INSTR;
                else nextState = state;
            end
            FILTER_CTL_CONF_INSTR: begin
                newData = ACCEL_INSTR_WR;
                Fl_Enable = 1;
                
                if(Fl_End) nextState = FILTER_CTL_CONF_REG;
                else nextState = state;
            end
            FILTER_CTL_CONF_REG: begin
                newData = ACCEL_REG_FILTER_CTL;
                Fl_Enable = 1;

                if(Fl_End) nextState = FILTER_CTL_CONF_DATA;
                else nextState = state;
            end
            FILTER_CTL_CONF_DATA: begin
                newData = ACCEL_CONF_FILTER_PARAM_SET;
                Fl_Enable = 1;

                if(Fl_End) nextState = FILTER_CTL_CONF_COOLOFF; //NOTE!! CS SHOULD BE HIGH FOR SOME TIME AFTER POSEDGE
                else nextState = state;              //Next state could hold Fl_Enable until !Fl_End before prep
            end   
            FILTER_CTL_CONF_COOLOFF: begin
                Fl_Enable = 1;

                if(!Fl_End) nextState = XDATA_PREP; 
                else nextState = state;
            end                    
            
            XDATA_PREP: begin
                Fl_Enable = 0;

                if(!Fl_Stop) nextState = XDATA_INSTR;
                else nextState = state;
            end
            XDATA_INSTR: begin
                newData = ACCEL_INSTR_RD;
                Fl_Enable = 1;

                if(Fl_End) nextState = XDATA_REG;
                else nextState = state;
            end
            XDATA_REG: begin
                newData = ACCEL_REG_XDATA;
                Fl_Enable = 1;
                
                if(Fl_End) nextState = XDATA_DATA;
                else nextState = state;
            end

            XDATA_DATA: begin
                Fl_Enable = 1;

                if(Fl_End) nextState = XDATA_SAMPLE;
                else nextState = state; 
            end
            XDATA_SAMPLE: begin
                Fl_Enable = 1;
                sample_raw_x = 1;

                if(!Fl_End) nextState = YDATA_DATA;
                else nextState = state;
            end

            YDATA_DATA: begin
                Fl_Enable = 1;

                if(Fl_End) nextState = YDATA_SAMPLE;
                else nextState = state; 
            end
            YDATA_SAMPLE: begin
                Fl_Enable = 1;
                sample_raw_y = 1;

                if(!Fl_End) nextState = ZDATA_DATA;
                else nextState = state;
            end
            
            ZDATA_DATA: begin
                Fl_Enable = 1;

                if(Fl_End) nextState = ZDATA_SAMPLE;
                else nextState = state;
            end
            ZDATA_SAMPLE: begin
                Fl_Enable = 1;
                sample_raw_z = 1;

                if(!Fl_End) nextState = TEMP_PREP;
                else nextState = state;
            end
            
            TEMP_PREP: begin
                Fl_Enable = 1;

                if(!Fl_End) nextState = TEMP_INSTR; 
                else nextState = state;
            end
            TEMP_INSTR: begin
                newData = ACCEL_INSTR_RD;
                Fl_Enable = 1;

                if(Fl_End) nextState = TEMP_REG;
                else nextState = state;
            end
            TEMP_REG: begin
                newData = ACCEL_REG_TEMP_L;
                Fl_Enable = 1;
                
                if(Fl_End) nextState = TEMP_L_DATA;
                else nextState = state;
            end

            TEMP_L_DATA: begin
                Fl_Enable = 1;

                if(Fl_End) nextState = TEMP_L_SAMPLE;
                else nextState = state;

            end
            TEMP_L_SAMPLE: begin
                Fl_Enable = 1;
                sample_raw_t_part_l = 1;

                if(!Fl_End) nextState = TEMP_H_DATA;
                else nextState = state;
            end

            TEMP_H_DATA: begin
                Fl_Enable = 1;

                if(Fl_End) nextState = TEMP_H_SAMPLE;
                else nextState = state;

            end
            TEMP_H_SAMPLE: begin
                Fl_Enable = 1;
                sample_raw_z = 1;

                if(!Fl_End) nextState = CONVERT_RAW_TO_ASCII;
                else nextState = state;
            end

            // SAMPLE_NUM_CHECK: begin
                

            //     if(filled) nextState = ENABLE_UART_TRANSMITTION;
            //     else nextState = CONVERT_RAW_TO_ASCII;
            // end
            CONVERT_RAW_TO_ASCII: begin
                convert_to_ascii = 1;

                nextState = WAIT_FOR_RD;
            end
            WAIT_FOR_RD: begin //Buffer state, meant to give counter time to set filled
                dataWaitEn = 1;
                
                if(filled) begin
                    if(dataWaitTimer == 5) nextState = ENABLE_UART_TRANSMITTION;
                    else nextState = state;
                end 
                else nextState = XDATA_PREP;
            end
            ENABLE_UART_TRANSMITTION: begin
                data_ready_for_printing = 1;

                nextState = XDATA_PREP;
            end
            

            default: begin
                nextState = IDLE;
            end
            // STOP: begin
                
            // end
        endcase
    end

endmodule