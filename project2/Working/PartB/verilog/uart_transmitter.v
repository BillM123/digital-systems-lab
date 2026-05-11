//`include "Working/verilog/baud_controller.v"

module uart_transmitter(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    input reset, clk;
    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    input Tx_EN; //activator signal (transmitter On)
    input Tx_WR; //Data loaded, ok to send (on for a cycle)
    output reg TxD; //Data to be sent
    output reg Tx_BUSY; //raise when sending data

    reg [3:0] enableCounter; //counts sample_ENABLEs, write new bit every 16
    reg [2:0] writeCounter; //Calc which bit should be sent while in DATA state
    reg [2:0] state, nextState;
    reg switchEnable; //signify 16 sample enables to fsm
    reg parity;
    reg idle_i, data_i; //signify in which state we are in for always blocks outside fsm

    parameter [2:0] IDLE   = 3'b000,
                    START  = 3'b001,
                    DATA   = 3'b010,
                    PARITY = 3'b011,
                    STOP   = 3'b100;

    baud_controller baud_controller_tx_inst(reset, clk, baud_select, Tx_EN, Tx_sample_ENABLE);

    //Switch fsm states as assigned below
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end
        else begin
            state <= nextState;
        end
    end
    //Moore FSM
    always @(state or switchEnable or writeCounter or parity or Tx_EN or Tx_WR or Tx_DATA) begin
        
        case (state)
            //----IDLE---
            IDLE: begin
                Tx_BUSY = 0; //Report Idle
                TxD = 1; //Transmit 1 at idle
                idle_i = 1;
                data_i = 0;

                if (Tx_EN == 1 && Tx_WR == 1) begin
                    nextState = START;
                end
                else nextState = state;
            end
            //---START--- 
            START: begin
                TxD = 0; //start bit
                Tx_BUSY = 1; //here so fsm remains moore
                idle_i = 0;
                data_i = 0;

                if(switchEnable) begin //load new state
                    nextState = DATA;
                end
                else nextState = state;
            end
            //----DATA---
            DATA: begin 
                TxD = Tx_DATA[writeCounter]; //Read every message bit
                Tx_BUSY = 1; //...prevents latch
                idle_i = 0;
                data_i = 1;

                if(switchEnable) begin //load new state
                    if (writeCounter == 3'b111) begin
                        nextState = PARITY; //only if everything transmitted
                    end
                    else nextState = state;
                end
                else nextState = state;
            end
            //---PARITY--
            PARITY: begin 
                Tx_BUSY = 1; //...prevents latch
                TxD = parity; //Parity bit
                idle_i = 0;
                data_i = 0;

                if(switchEnable) begin //load new state
                    nextState = STOP;                    
                end
                else nextState = state;
            end
            //----STOP---
            STOP: begin
                TxD = 1; //Stop Bit
                Tx_BUSY = 1; //...prevents latch
                idle_i = 0;
                data_i = 0;

                if(switchEnable) begin //load new state
                    nextState = IDLE;
                end
                else nextState = state;
            end
            //---ERROR---
            default: begin
                TxD = 0;
                Tx_BUSY = 0;
                idle_i = 0;
                data_i = 0;

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
            if(idle_i == 1) enableCounter <= 0; //Count sampling signals only if we start writing
            
            else if(Tx_sample_ENABLE == 1) enableCounter <= enableCounter + 1;

            if(enableCounter == 4'b1111 && Tx_sample_ENABLE == 1) begin 
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
    //parity calculation
    always @(posedge clk or posedge reset) begin
        if(reset) parity <= 0;
        else begin
            if (data_i == 1) begin
                parity <= ^Tx_DATA; // XOR reduction to calculate parity bit
            end
        end
    end
    
endmodule
