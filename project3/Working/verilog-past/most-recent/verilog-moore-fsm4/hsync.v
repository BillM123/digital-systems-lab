module hsync (
    clk, reset, RGB, HSYNC, HPIXEL
);

    input clk, reset;
    
    output reg RGB, HSYNC;
    output reg [7:0] HPIXEL;

    reg [2:0] state, nextState;
    reg [11:0]timeCount;

    reg RGB_rd, HSYNC_rd;

    parameter[11:0] SCANLINE_TIME = 12'd3200,
                    PULSE_WIDTH_TIME = 12'd384,
                    BACK_PORCH_TIME = 12'd192,
                    DISPLAY_TIME = 12'd2560,
                    FRONT_PORCH_TIME = 12'd64;


    parameter [1:0] PULSE = 2'd0,
                    BACK_PORCH = 2'd1,
                    DISPLAY = 2'd2,
                    FRONT_PORCH = 2'd3;


    always @(posedge clk, posedge reset) begin
        if(reset)begin
            state <= PULSE;
        end
        else begin
            state <= nextState;
        end
    end

    always @(reset or timeCount or state)begin
        case (state)
            PULSE: begin
                if(timeCount == PULSE_WIDTH_TIME) begin
                    nextState = BACK_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            BACK_PORCH: begin
                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME) begin
                    nextState = DISPLAY;
                end
                else begin
                    nextState = state;
                end
            end
            DISPLAY: begin
                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME + DISPLAY_TIME) begin
                    nextState = FRONT_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            FRONT_PORCH: begin
                if(timeCount == SCANLINE_TIME) begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end
            default: begin
                nextState = PULSE;
            end
        endcase
    end

    always @(reset or timeCount or state)begin
        case (state)
            PULSE: begin
                HSYNC_rd = 0;
                RGB_rd = 0;
            end
            BACK_PORCH: begin
                HSYNC_rd = 1;
                RGB_rd = 0;
            end
            DISPLAY: begin
                HSYNC_rd = 1;
                RGB_rd = 1;
            end
            FRONT_PORCH: begin
                HSYNC_rd = 1;
                RGB_rd = 0;
            end
            default: begin
                HSYNC_rd = 0;
                RGB_rd = 0;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset)begin
            HSYNC <= 1;
            RGB <= 0;
        end
        else begin
            HSYNC <= HSYNC_rd;
            RGB <= RGB_rd;
        end
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

