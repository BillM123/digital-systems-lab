module vsync (
    clk, reset, pixel_ok, RGB, VSYNC, VPIXEL
);

    input clk, reset, pixel_ok;
    
    output reg RGB, VSYNC;
    output reg [6:0] VPIXEL;

    reg [2:0] state, nextState;
    reg [20:0]timeCount;
    reg [3:0] pixelCount;
    reg video_i;

    parameter[20:0] FRAME_TIME = 21'd1667200,//200 to keep timings consistent
                    PULSE_WIDTH_TIME = 21'd6400,
                    BACK_PORCH_TIME = 21'd92800,
                    ACTIVE_VIDEO_TIME = 21'd1536000,
                    FRONT_PORCH_TIME = 21'd32000;

    parameter [2:0] OFF = 3'd0,
                    PULSE = 3'd1,
                    BACK_PORCH = 3'd2,
                    ACTIVE_VIDEO = 3'd3,
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
                VSYNC = 1;
                RGB = 0;
                video_i = 0;

                if(reset == 0)begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end 
            PULSE: begin
                VSYNC = 0;
                RGB = 0;
                video_i = 0;

                if(timeCount == PULSE_WIDTH_TIME) begin
                    nextState = BACK_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            BACK_PORCH: begin
                VSYNC = 1;
                RGB = 0;
                video_i = 0;

                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME) begin
                    nextState = ACTIVE_VIDEO;
                end
                else begin
                    nextState = state;
                end
            end
            ACTIVE_VIDEO: begin
                VSYNC = 1;
                RGB = 1;
                video_i = 1;

                if(timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME + ACTIVE_VIDEO_TIME) begin
                    nextState = FRONT_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            FRONT_PORCH: begin
                VSYNC = 1;
                RGB = 0;
                video_i = 0;

                if(timeCount == FRAME_TIME) begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end
            default: begin
                VSYNC = 0;
                RGB = 0;
                video_i = 0;
                
                nextState = OFF;
            end
        endcase
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
            VPIXEL <= 96;
            pixelCount <= 0;
        end
        else begin
            if(video_i == 1) begin
                if(pixel_ok == 1)begin

                    pixelCount <= pixelCount + 1;

                    if(pixelCount == 4)begin
                        pixelCount <= 0;
                        // if(VPIXEL == 7'd95)begin
                            // VPIXEL <= 0;
                            // pixelCount <= 0;
                        // end else begin
                        VPIXEL <= VPIXEL + 1;
                        //end    
                    end
                end
                //else begin
                //    VPIXEL <= 0;
                //    pixelCount <= 0;
                //end
            end
            else begin
                VPIXEL <= 0;
                pixelCount <= 0;
            end
        end
    end
endmodule
//Changes: added if video_i so vpixel only changes in video
//         if vpixel not in video set to 0
//         also rm'ed if VPIXEL == 95, this should be the 
//         when exiting video
