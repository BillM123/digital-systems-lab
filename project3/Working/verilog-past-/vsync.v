module vsync (
    clk, reset, RGB, VSYNC, VPIXEL
);

    input clk, reset;
    
    output reg RGB, VSYNC;
    output reg [7:0] VPIXEL;

    reg [2:0] state, nextState;
    reg [20:0]timeCount;
    reg switch;

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

    always @(reset or switch or state)begin
        case (state)
            OFF: begin
                VSYNC = 1;
                RGB = 0;

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

                if(switch) begin
                    nextState = BACK_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            BACK_PORCH: begin
                VSYNC = 1;
                RGB = 0;

                if(switch) begin
                    nextState = ACTIVE_VIDEO;
                end
                else begin
                    nextState = state;
                end
            end
            ACTIVE_VIDEO: begin
                VSYNC = 1;
                RGB = 1;

                if(switch) begin
                    nextState = FRONT_PORCH;
                end
                else begin
                    nextState = state;
                end
            end
            FRONT_PORCH: begin
                VSYNC = 1;
                RGB = 0;

                if(switch) begin
                    nextState = PULSE;
                end
                else begin
                    nextState = state;
                end
            end
            default: begin
                VSYNC = 0;
                RGB = 0;
                
                nextState = OFF;
            end
        endcase
    end

    //switch states logic
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            switch <= 0;
            timeCount <= 1;
        end
        else begin
            if(timeCount == PULSE_WIDTH_TIME
            || timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME
            || timeCount == PULSE_WIDTH_TIME + BACK_PORCH_TIME + ACTIVE_VIDEO_TIME)begin
                switch <= 1;
                timeCount <= timeCount + 1;
            end
            else if(timeCount == FRAME_TIME) begin
                switch <= 1;
                timeCount <= 1;
            end
            else begin
                switch <= 0;
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

