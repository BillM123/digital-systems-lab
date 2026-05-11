module SPI_Master (clk, reset, MISO, RDWR_start, New_Data, SCLK, MOSI, SS, Data, TR_OK);

    input clk, reset;
    input MISO; //Master In Slave Out
    input RDWR_start;
    input [7:0] New_Data;

    output SCLK; //Serial Clock (should be 1-8MHz)
    output MOSI; //Master Out Slave In
    output reg SS; //Slave Select (or Chip Select), active low
    output reg [7:0] Data;
    output reg TR_OK;

    reg [3:0] state, nextState;
    reg [20:0] timeCount;
    reg [9:0] state_i; //specific number of wires is wrong prob
    reg [2:0] dataCount;
    reg [20:0] timeCountMax;
    reg timeCountEnable;
    reg shiftEnable;

    parameter [20:0] MAX = 200;

    parameter [3:0] IDLE = 0,
                    DATA_START = 1,
                    DATA_TRANSMIT = 2,
                    DATA_SHIFT = 3,
                    DATA_HOLD = 4;

    //most below are minimum times, could increase
    //to ensure correct communication
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

    // MMCME2_BASE: Base Mixed Mode Clock Manager
    //              Artix-7
    // Xilinx HDL Language Template, version 2024.1

    //Below copied from first assignment, modify acordingly
    //NOTE: clock frequency: 100MHz (10ns)
    //      needed frequency: 5MHz  (0.20μs) (1/0,20μs = 5MHz)
    //      divide factor:    20counter    (100/5 = 20)
    MMCME2_BASE #(
        .BANDWIDTH("OPTIMIZED"),   // Jitter programming (OPTIMIZED, HIGH, LOW)
        //Change1: Changed from 5 to 10 to keep internal clock at 100MHz (10ns period)
        //Change2: Changed again to 6   
        //Change3: 6->10
        //Change4: 10->20
        //NEW: 6 -> 5 (4MHz)
        .CLKFBOUT_MULT_F(6.0),     // Multiply value for all CLKOUT (2.000-64.000).
        .CLKFBOUT_PHASE(0.0),      // Phase offset in degrees of CLKFB (-360.000-360.000).
        //Change1: Changed from 0 to... 10 (10ns period)
        .CLKIN1_PERIOD(10.0),       // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
        //Change2: changed from 1 to 120
        //Change3: 120->20 
        //Change4: 20->40
        //NEW: 120 -> 125 (4MHz)
        .CLKOUT1_DIVIDE(120),
        .CLKOUT2_DIVIDE(1),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        .CLKOUT6_DIVIDE(1),
        //Change1: Changed from 1 to 20 in accordance to divide factor
        //Change2: Changed back to 1
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
        //Change2: changed CLKIN1 to clk
        .CLKIN1(clk),       // 1-bit input: Clock
        // Control Ports: 1-bit (each) input: MMCM control ports
        .PWRDWN(PWRDWN),       // 1-bit input: Power-down
        .RST(RST),             // 1-bit input: Reset
        // Feedback Clocks: 1-bit (each) input: Clock feedback ports
        .CLKFBIN(CLKFBOUT)      // 1-bit input: Feedback clock
    );

    //NOTE: Might need to change clocks to mmcm output everywhere below!
    //      Already did 
    //      nvm

    //shift
    always@(posedge clk or posedge reset)begin
        if(reset) begin
            Data <= 0;
        end else begin
            if (shiftEnable) begin
                Data <= {Data[6:0], MISO};
            end
            else if (RDWR_start) begin
                Data <= New_Data;
            end
        end
    end

    assign MOSI = Data[7];

    //dataCount
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            dataCount <= 0;
        end
        else begin
            if(shiftEnable) begin
                dataCount <= dataCount + 1;
            end
            else if (TR_OK) begin
                dataCount <= 0;
            end
        end
    end

    //timeCount: uses fast clock on purpose (apparently used everywhere)
    //           meant to hold signals
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            timeCount <= 0;
        end
        else begin
            if(timeCountEnable)begin
                if(timeCount < timeCountMax-1)begin
                    timeCount <= timeCount + 1;
                end
            end
            else begin
                timeCount <= 0;
            end
        end
    end

    //slow clock count
    always @(posedge clk or posedge reset)begin
        if(reset) begin
            slowClockCount <= 0;
        end else begin
            if(locked) begin
                if(slowClockCount == TIME_FOR_5Hz_CLK_CYCKLE + 1)begin
                    slowClockCount <= 1;
                end
                else begin
                    slowClockCount <= slowClockCount + 1;
                end
            end
            else begin
                slowClockCount <= 1;
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
    always@(RDWR_start or timeCount)begin
        SS = 1;
        TR_OK = 0;
        timeCountEnable = 0;
        timeCountMax = 0;
        shiftEnable = 0;
        
        case(state)
            IDLE: begin
                if(RDWR_start == 1) begin
                    nextState = START;
                end
                else nextState = state;
            end
            DATA_START: begin
                SS = 0;
                timeCountEnable = 1;
                timeCountMax = CS_SETUP_TIME;

                //Also wait for one data to be exchanged
                if(timeCountMax == CS_SETUP_TIME && slowClockCount > TIME_FOR_5Hz_CLK_CYCKLE_HALF) begin
                    nextState = DATA_TRANSMIT;
                end
                else nextState = state;
            end
            DATA_TRANSMIT: begin
                SS = 0;

                if(slowClockCount == TIME_FOR_5Hz_CLK_CYCKLE) begin
                    if(dataCount == 7) begin
                        nextState = DATA_HOLD;
                    end
                    else begin
                        nextState = DATA_SHIFT; 
                    end
                end
                else nextState = state;
            end
            DATA_SHIFT: begin
                SS = 0;
                shiftEnable = 1;

                nextState = DATA_TRANSMIT;
            end
            DATA_HOLD:begin
                timeCountEnable = 1;
                timeCountMax = CS_HOLD_TIME;
                TR_OK = 1;

                if(timeCount == CS_HOLD_TIME) begin
                    if(RDWR_start) begin
                        nextState <= DATA_START;
                    end
                    else begin
                        nextState <= IDLE;
                    end     
                end
                else nextState = state;
            end
            default: begin
                
                nextState = state;
            end
        endcase
    end

endmodule