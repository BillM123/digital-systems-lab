module hsync (
    clk, reset, RGB, HSYNC, HPIXEL
);

    input clk, reset;
    
    output reg RGB, HSYNC;
    output reg [7:0] HPIXEL;

    reg [2:0] state, nextState;
    reg [11:0]timeCount;

    parameter[11:0] SCANLINE_TIME = 12'd3200,
                    PULSE_WIDTH_TIME = 12'd384,
                    BACK_PORCH_TIME = 12'd192,
                    DISPLAY_TIME = 12'd2560,
                    FRONT_PORCH_TIME = 12'd64;

    parameter [2:0] OFF = 3'd0,
                    PULSE = 3'd1,
                    BACK_PORCH = 3'd2,
                    DISPLAY = 3'd3,
                    FRONT_PORCH = 3'd4;


    always @(posedge clk, posedge reset) begin
        if(reset)begin
            state <= OFF;
        end
        else begin
            state <= nextState;
        end
    end

    always @(reset or timeCount or state)begin
        case (state)
            OFF: begin
                HSYNC = 1;
                RGB = 0;

                if(reset == 0)begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end 
            PULSE: begin
                HSYNC = 0;
                RGB = 0;

                if(timeCount == PULSE_WIDTH_TIME) begin
                    nextState = BACK_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            BACK_PORCH: begin
                HSYNC = 1;
                RGB = 0;

                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME) begin
                    nextState = DISPLAY;
                end
                else begin
                    nextState = state;
                end
            end
            DISPLAY: begin
                HSYNC = 1;
                RGB = 1;

                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME + DISPLAY_TIME) begin
                    nextState = FRONT_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            FRONT_PORCH: begin
                HSYNC = 1;
                RGB = 0;

                if(timeCount == SCANLINE_TIME) begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end
            default: begin
                HSYNC = 0;
                RGB = 0;
                
                nextState = OFF;
            end
        endcase
    end

    //switch states logic
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            timeCount <= 1;
        end
        else begin
            if(timeCount == SCANLINE_TIME) begin
                timeCount <= 1;
            end
            else begin
                timeCount <= timeCount + 1;    
            end
        end
    end
    
    //Hpixel logic
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            HPIXEL <= 0;
        end
        else begin
            if(timeCount == SCANLINE_TIME)begin
                HPIXEL <= HPIXEL + 1;
            end
        end
    end
endmodule

