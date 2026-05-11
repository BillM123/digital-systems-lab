//`include "Working/verilog/baud_controller.v"

module uart_receiver(reset, clk, Rx_DATA, baud_select, Rx_EN, RxD, Rx_FERROR, Rx_PERROR, Rx_VALID);

    input reset, clk;
    input [2:0] baud_select;
    input Rx_EN; //Enable
    input RxD; //Received data?
    //Note: keep outputs on after transmittion until new start bit
    output reg [7:0] Rx_DATA;
    output reg Rx_FERROR; // Framing Error //
    output reg Rx_PERROR; // Parity Error //
    output reg Rx_VALID; // Rx_DATA is Valid //

    reg [7:0] Rx_DATA_buf; //Data buffer, so data can hold curr data until new data is valid
    reg [3:0] enableCounter;
    reg [2:0] writeCounter;
    reg [2:0] state, nextState;
    reg switchEnable;
    reg parity;

    //signify in which state we are in for always blocks outside fsm
    //also helps keep data without latches by having it outside the fsm
    reg data_i;
    reg ferror_i;
    reg perror_i;
    reg valid_i; 
    reg parity_i;
    reg idle_i;
    reg start_i;

    parameter [2:0] IDLE   = 3'b000,
                    START  = 3'b001,
                    DATA   = 3'b010,
                    PARITY = 3'b011,
                    STOP   = 3'b100,
                    VALID  = 3'b101,
                    PERROR = 3'b110,
                    FERROR = 3'b111;

    baud_controller baud_controller_rx_inst(reset, clk, baud_select, Rx_EN, Rx_sample_ENABLE);
    
    //Switch fsm states as assigned below
    always @(posedge clk or posedge reset) begin
        if(reset)begin
            state <= IDLE;
        end
        else begin
            state <= nextState;
        end
    end
    //Moore FSM
    always @(state or switchEnable or writeCounter or parity or RxD or Rx_EN) begin
        case (state)
            //IDLE
            IDLE: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 1;
                start_i = 0;

                if(RxD == 0 && Rx_EN == 1)begin
                    nextState = START; //start if active and start bit sent
                end
                else nextState = state;
            end
            //START
            START: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 1;

                if (switchEnable) begin
                    if(RxD == 0) begin
                        nextState = DATA; //ensure alignment
                    end
                    else begin
                        nextState = FERROR; //bad alignment
                    end
                end
                else nextState = state;
            end
            //DATA
            DATA: begin
                data_i = 1;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;

                if(switchEnable)begin
                    if (writeCounter == 3'b111) begin
                        nextState = PARITY; //keep reading until the full char is read
                    end
                    else begin
                        nextState = DATA;
                    end
                end
                else nextState = state;
            end
            //PARITY CHECK
            PARITY: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 1;
                idle_i = 0;
                start_i = 0;

                if(switchEnable)begin
                    if(parity == 0)begin //assumes even parity
                        nextState = STOP;
                    end
                    else begin
                        nextState = PERROR; //Wrong parity bit
                    end
                end
                else nextState = state;
            end
            //STOP CHECK
            STOP: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;

                if(switchEnable)begin
                    if(RxD == 1) begin
                        nextState = VALID;
                    end
                    else begin
                        nextState = FERROR; //bad framing
                    end
                end
                else nextState = state;
            end
            //VALID
            VALID: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 1;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;

                if (switchEnable) begin
                    nextState = IDLE; //simply raises valid
                end
                else nextState = state;
            end
            //FRAMING ERROR
            FERROR: begin
                data_i = 0;
                ferror_i = 1;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;

                if (switchEnable) begin
                    nextState = IDLE; //user should be mindful if transmitter keeps transmitting
                end
                else nextState = state;
            end
            //PARITY ERROR
            PERROR: begin
                data_i = 0;
                ferror_i = 0;
                perror_i = 1;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;
    
                if (switchEnable) begin 
                    nextState = IDLE; //user should be mindful if transmitter keeps transmitting
                end
                else nextState = state;
            end
            //ERROR
            default: begin
                data_i = 8'b0;
                ferror_i = 0;
                perror_i = 0;
                valid_i = 0;
                parity_i = 0;
                idle_i = 0;
                start_i = 0;

                nextState = IDLE;
            end
        endcase
    end
    //enableCounter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            enableCounter <= 0;
            switchEnable <= 0;
        end
        else begin
            if(idle_i == 1) enableCounter <= 0; //wait for start bit to synchronise
            else if(Rx_sample_ENABLE == 1) enableCounter <= enableCounter + 1;

            //open at half of period
            if(enableCounter == 4'b0111 && Rx_sample_ENABLE == 1) begin 
                switchEnable <= 1; //keep write from being open for more than one period
            end
            else switchEnable <= 0;
        end
    end
    //writeCounter
    always @(posedge clk or posedge reset) begin
        if (reset) writeCounter <= 0;
        else begin //increase only if we are writing from data
            if(data_i == 1 && switchEnable == 1) writeCounter <= writeCounter + 1;
        end
    end
    //parity
    always @(posedge clk or posedge reset) begin
        if (reset) parity <= 0;
        else begin
            if (parity_i == 1) begin
                parity <= ^Rx_DATA_buf + RxD; // XOR reduction to calculate parity bit
            end
        end
    end
    //Responsible for driving outputs so they can retain their value
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Rx_DATA <= 0;
            Rx_DATA_buf <= 0;
            Rx_VALID <= 0;
            Rx_FERROR <= 0;
            Rx_PERROR <= 0;
        end
        else begin
            //outputs reset after start bit, exept data which keeps previous output
            if(start_i == 1)begin
                Rx_DATA_buf <= 0;
                Rx_VALID <= 0;
                Rx_FERROR <= 0;
                Rx_PERROR <= 0;
            end
            //load data buff while on data state
            if(data_i == 1)begin
                Rx_DATA_buf[writeCounter] <= RxD;
            end
            //if data is valid, data can safely be given contents of data buf
            if(valid_i == 1)begin
                Rx_VALID <= 1;
                Rx_DATA <= Rx_DATA_buf;
            end
            //theese error signals and above will retain value until new start bit
            if(ferror_i == 1)begin
                Rx_FERROR <= 1;
            end
            if (perror_i == 1) begin
                Rx_PERROR <= 1;
            end
        end
    end

endmodule
