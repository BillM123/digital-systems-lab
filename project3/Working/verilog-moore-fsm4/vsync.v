module vsync (
    clk, reset, RGB, VSYNC, VPIXEL
);

    input clk, reset;
    
    output reg RGB, VSYNC;
    output reg [7:0] VPIXEL;

    reg [2:0] state, nextState;
    reg [20:0]timeCount;

    reg RGB_rd, VSYNC_rd;

    parameter[20:0] FRAME_TIME = 21'd1667200,//200 to keep timings consistent
                    PULSE_WIDTH_TIME = 21'd6400,
                    BACK_PORCH_TIME = 21'd92800,
                    ACTIVE_VIDEO_TIME = 21'd1536000,
                    FRONT_PORCH_TIME = 21'd32000;

    
    parameter [1:0] PULSE = 2'd0,
                    BACK_PORCH = 2'd1,
                    ACTIVE_VIDEO = 2'd2,
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
                    nextState = ACTIVE_VIDEO;
                end
                else begin
                    nextState = state;
                end
            end
            ACTIVE_VIDEO: begin
                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME + ACTIVE_VIDEO_TIME) begin
                    nextState = FRONT_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            FRONT_PORCH: begin
                if(timeCount == FRAME_TIME) begin
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
                VSYNC_rd = 0;
                RGB_rd = 0;
            end
            BACK_PORCH: begin
                VSYNC_rd = 1;
                RGB_rd = 0;
            end
            ACTIVE_VIDEO: begin
                VSYNC_rd = 1;
                RGB_rd = 1;
            end
            FRONT_PORCH: begin
                VSYNC_rd = 1;
                RGB_rd = 0;
            end
            default: begin
                VSYNC_rd = 0;
                RGB_rd = 0;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset)begin
            VSYNC <= 1;
            RGB <= 0;
        end
        else begin
            VSYNC <= VSYNC_rd;
            RGB <= RGB_rd;
        end
    end

    //cycle counter logic
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            timeCount <= 1;
        end
        else begin
            if(timeCount == FRAME_TIME) begin
                timeCount <= 1;
            end
            else begin
                timeCount <= timeCount + 1;    
            end
            
        end
    end
    
    //Vpixel logic
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            VPIXEL <= 0;
        end
        else begin
            if(timeCount == FRAME_TIME)begin
                if(VPIXEL == 7'd95)begin
                    VPIXEL <= 0;
                end
                else begin
                    VPIXEL <= VPIXEL + 1;    
                end
            end
        end
    end
endmodule

