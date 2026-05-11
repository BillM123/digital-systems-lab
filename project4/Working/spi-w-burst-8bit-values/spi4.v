module spi (
    input clk, reset,
    input MISO,
    input [7:0] newData,
    input Fl_En,

    output reg MOSI,
    output SCLK,
    output reg CS, //active low
    output reg [7:0] dataOut,
    output reg Fl_Ready,//Notification to load new data
    output reg Fl_End 
                     //Can be used to stop transmittions   
);

    reg reg_saveReceived, reg_loadTransmition;
    reg sclkOld, sclkNew;
    reg [3:0] state, nextState;
    reg [7:0] data; //register to hold data until full or EOT
    reg Fl_Stop; //Signifies end of transmittion
    reg [10:0] slowClockCount; //could reduce max value
    reg sclkCounterEnable, sclkCounterPreEnable;

    wire locked;

    MMCME2_BASE #(
        .BANDWIDTH("OPTIMIZED"),   // Jitter programming (OPTIMIZED, HIGH, LOW)
        .CLKFBOUT_MULT_F(6.0),     // Multiply value for all CLKOUT (2.000-64.000).
        .CLKFBOUT_PHASE(0.0),      // Phase offset in degrees of CLKFB (-360.000-360.000).
        .CLKIN1_PERIOD(10.0),       // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
        .CLKOUT1_DIVIDE(120),
        .CLKOUT2_DIVIDE(1),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        .CLKOUT6_DIVIDE(1),
        .CLKOUT0_DIVIDE_F(1.0),    // Divide amount for CLKOUT0 (1.000-128.000).
        // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        .CLKOUT6_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .CLKOUT6_PHASE(0.0),
        .CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
        .DIVCLK_DIVIDE(1),         // Master division value (1-106)
        .REF_JITTER1(0.0),         // Reference input jitter in UI (0.000-0.999).
        //changed this also
        .STARTUP_WAIT("TRUE")     // Delays DONE until MMCM is locked (FALSE, TRUE)
    )
    MMCME2_BASE_inst (
        // Clock Outputs: 1-bit (each) output: User configurable clock outputs
        .CLKOUT0(CLKOUT0),     // 1-bit output: CLKOUT0
        .CLKOUT0B(CLKOUT0B),   // 1-bit output: Inverted CLKOUT0
        //Note: CLKOUT1 will be used as the serial clock
        .CLKOUT1(SCLK),     // 1-bit output: CLKOUT1
        .CLKOUT1B(CLKOUT1B),   // 1-bit output: Inverted CLKOUT1
        .CLKOUT2(CLKOUT2),     // 1-bit output: CLKOUT2
        .CLKOUT2B(CLKOUT2B),   // 1-bit output: Inverted CLKOUT2
        .CLKOUT3(CLKOUT3),     // 1-bit output: CLKOUT3
        .CLKOUT3B(CLKOUT3B),   // 1-bit output: Inverted CLKOUT3
        .CLKOUT4(CLKOUT4),     // 1-bit output: CLKOUT4
        .CLKOUT5(CLKOUT5),     // 1-bit output: CLKOUT5
        .CLKOUT6(CLKOUT6),     // 1-bit output: CLKOUT6
        // Feedback Clocks: 1-bit (each) output: Clock feedback ports
        .CLKFBOUT(CLKFBOUT),   // 1-bit output: Feedback clock
        .CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT
        // Status Ports: 1-bit (each) output: MMCM status ports
        .LOCKED(locked),       // 1-bit output: LOCK
        // Clock Inputs: 1-bit (each) input: Clock input
        .CLKIN1(clk),       // 1-bit input: Clock
        // Control Ports: 1-bit (each) input: MMCM control ports
        .PWRDWN(PWRDWN),       // 1-bit input: Power-down
        .RST(RST),             // 1-bit input: Reset
        // Feedback Clocks: 1-bit (each) input: Clock feedback ports
        .CLKFBIN(CLKFBOUT)      // 1-bit input: Feedback clock
    );

    //Enable and synchronise sclk counter with posedge
    //of sclk and clk 
    always @(posedge SCLK)begin
        if(locked) sclkCounterPreEnable <= 1;
        else sclkCounterPreEnable <= 0;
    end

    always @(posedge clk)begin
        if(sclkCounterEnable) sclkCounterEnable <= 1;
        else sclkCounterEnable <= 0;
    end

    //Starting at the sclk positive edge when mmcm is locked,
    //counts the clock cycles of the sclk using clk. 
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            timeCount <= 0;
        end
        else begin
            if(sclkCounterEnable)begin
                if(timeCount < 20)begin//5MHz clock
                    timeCount <= timeCount + 1;
                end
                else begin
                    timeCount <= 0;
                end
            end
            else begin
                timeCount <= 0;
            end
        end
    end

    //Data: Load new, transmit and receive
    //TODO: Find a way to load new data at byte comm end
    //      Separate MISO and MOSI logic
    //      Find a way to activate the appropriate register
    always@(posedge clk or posedge reset)begin
        if(reset) begin
            data <= 0;
            dataOut <= 0;
        end else begin
            if(!Fl_Ed && shNew != shOld) begin
                if (Fl_End) begin
                    dataOut <= {data[6:0], MISO};
                    data <= newData;
                end
                else begin
                    data <= {data[6:0], MISO};
                end
            end
            else if(Fl_Stop) begin
                dataOut <= data;
            end
        end
    end
    
    //fsm: sequential
    always@(posedge clk or posedge reset)begin
        if(reset) begin
            state <= IDLE;
        end
        else begin
            state <= nextState;
        end
    end

    //fsm:combinational
    always @(state or Fl_En or slowClockCount or sclkOld or sclkNew) begin
        Fl_Stop = 0;
        Fl_Ready = 0;
        Fl_End = 0;
        reg_loadTransmition = 0;
        reg_saveReceived = 0;

        case(state)
            IDLE: begin
                CS = 1;
                
                if(Fl_En && timeCount == 10) nextState = DATA1_TRANSMIT;
                else nextState = state;
            end

            DATA1_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA1_SAMPLE;
                else nextState = state;
            end
            DATA1_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA2_TRANSMIT;
                else nextState = state;
            end

            DATA2_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA2_SAMPLE;
                else nextState = state;
            end
            DATA2_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA3_TRANSMIT;
                else nextState = state;
            end

            DATA3_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA3_SAMPLE;
                else nextState = state;
            end
            DATA3_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA4_TRANSMIT;
                else nextState = state;
            end

            DATA4_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA4_SAMPLE;
                else nextState = state;
            end
            DATA4_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA5_TRANSMIT;
                else nextState = state;
            end

            DATA5_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA5_SAMPLE;
                else nextState = state;
            end
            DATA5_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA6_TRANSMIT;
                else nextState = state;
            end

            DATA6_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA6_SAMPLE;
                else nextState = state;
            end
            DATA6_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA7_TRANSMIT;
                else nextState = state;
            end

            DATA7_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA7_SAMPLE;
                else nextState = state;
            end
            DATA7_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = DATA8_TRANSMIT;
                else nextState = state;
            end

            DATA8_TRANSMIT: begin
                CS = 0;
                reg_loadTransmition = 1;
                Fl_Ready = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 10) nextState = DATA8_SAMPLE;
                else nextState = state;
            end
            DATA8_SAMPLE: begin
                CS = 0;
                reg_saveReceived = 1;
                Fl_End = 1;

                if(!Fl_En) nextState = STOP;
                else if(timeCount == 0) nextState = STOP;
                else nextState = state;
            end
            
            STOP: begin
                CS = 1;
                shift = 0;
                Fl_Stop = 1;

                if(timeCount == 10) nextState = IDLE;
                else nextState = state;
                
            end

            default: begin
                CS = 1;
                shift = 0;

                nextState = IDLE;
            end
        endcase
    end

endmodule