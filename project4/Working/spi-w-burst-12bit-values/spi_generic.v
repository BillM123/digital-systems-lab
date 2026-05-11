module spi (
    input clk, reset,
    input MISO,
    input [7:0] newData,
    input Fl_En,

    output reg MOSI,
    output SCLK,
    output reg CS, //active low
    output reg [7:0] dataOut,
    output reg Fl_Rd,//Notification to load new data
    output reg Fl_St //Will be 1 during first data transaction.
                     //Can be used to stop transmittions   
);
    reg shift, shOld, shNew;
    reg sclkOld, sclkNew;
    reg [3:0] state, nextState;
    reg [7:0] data; //register to hold data until full or EOT
    reg Fl_Ed; //Signifies end of transmittion
    reg [10:0] slowClockCount; //could reduce max value
    wire locked;

    parameter [6:0] CS_SETUP_TIME = 10,
                    CS_HOLD_TIME = 2,
                    CS_DISABLE_TIME = 2,
                    DATA_SETUP_TIME = 2,
                    DATA_HOLD_TIME = 2,
                    CLOCK_HIGH_TIME = 5,
                    CLOCK_LOW_TIME = 5,
                    CLOCK_ENABLE_TIME = 2.5,
                    MAX_OUT_VALID_CLOCK_LOW_TIME = 5,
                    MAX_OUT_DISABLE_TIME = 2.5,
                    TIME_FOR_5Hz_CLK_CYCKLE = 20,
                    TIME_FOR_5Hz_CLK_CYCKLE_HALF = 10;

    parameter [3:0] IDLE = 0,
                    DATA1 = 1,
                    DATA2 = 2,
                    DATA3 = 3,
                    DATA4 = 4,
                    DATA5 = 5,
                    DATA6 = 6,
                    DATA7 = 7,
                    DATA8 = 8,
                    STOP = 9;

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

    //slow clock count
    always @(posedge clk)begin
        if(locked) begin
            sclkNew <= SCLK;
            sclkOld <= sclkNew;
        end
    end


    //shOld and shNew will be different for one cycle
    //during which, data will shift once
    always @(posedge clk) begin
        shNew <= shift;
        shOld <= shNew;
    end

    //shift
    always@(posedge clk or posedge reset)begin
        if(reset) begin
            data <= 0;
            dataOut <= 0;
            MOSI <= 0;
        end else begin
            if(!Fl_Ed && shNew != shOld) begin
                if (Fl_St) begin
                    dataOut <= {data[6:0], MISO};
                    data <= newData;
                end
                else begin
                    data <= {data[6:0], MISO};
                end
                MOSI <= data[7];
            end
            else if(Fl_Ed) begin
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
        Fl_St = 0;
        Fl_Rd = 0;
        Fl_Ed = 0;

        case(state)
            IDLE: begin
                CS = 1;
                shift = 0;
                
                if(Fl_En && sclkOld == 0 && sclkNew == 1) nextState = DATA1;
                else nextState = state;
            end
            DATA1: begin
                Fl_St = 1;
                CS = 0;
                shift = 1;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA2;
                else nextState = state;
            end
            DATA2: begin
                CS = 0;
                shift = 0;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA3;
                else nextState = state;
            end
            DATA3: begin
                CS = 0;
                shift = 1;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA4;
                else nextState = state;
            end
            DATA4: begin
                CS = 0;
                shift = 0;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA5;
                else nextState = state;
            end
            DATA5: begin
                CS = 0;
                shift = 1;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA6;
                else nextState = state;
            end
            DATA6: begin
                CS = 0;
                shift = 0;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA7;
                else nextState = state;
            end
            DATA7: begin
                CS = 0;
                shift = 1;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA8;
                else nextState = state;
            end
            DATA8: begin
                CS = 0;
                shift = 0;
                Fl_Rd = 1;

                if(!Fl_En) nextState = STOP;
                else if(sclkOld == 0 && sclkNew == 1) nextState = DATA1;
                else nextState = state;
            end
            //Note: it is the responsibility of the driver
            //to not terminate the transfer at sclk negedge
            STOP: begin
                CS = 1;
                shift = 0;
                Fl_Ed = 1;

                //NOTE: like this it will take at least one slow 
                //clock cycle to "cool off". Might be prudent to 
                //add negede or count exact disable time
                if(sclkOld == 0 && sclkNew == 1) nextState = IDLE;
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
