//`include "Working/verilog/baud_controller.v"

module uart_transmitter(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    input reset, clk;
    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    input Tx_EN; //activator signal (data loaded)
    input Tx_WR; //?
    output TxD; //Data to be sent
    output Tx_BUSY; //raise when sending data

    reg [3:0] enableCounter;
    reg [2:0] writePointer;
    
    baud_controller baud_controller_tx_inst(reset, clk, baud_select, Tx_sample_ENABLE);

    //Wait for sufficient sample_ENABLE
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            writePointer <= 0;
            enableCounter <= 0;
        end
        else begin
            if(Tx_sample_ENABLE == 1)begin
                enableCounter <= enableCounter + 1;
                
                if(enableCounter <= 4'd16) begin
                    writePointer <= writePointer + 1;
                    
                    if(writePointer <= 3'd0) TxD <= 1; //Start Bit
                    else if(writePointer <= 3'd9)  TxD <= 0; //Parity bit
                    else if(writePointer <= 3'b10) begin //Stop Bit
                        TxD <= 1; 
                        writePointer <= 0;
                    end
                    else TxD <= Tx_DATA[writePointer]; //Message
                end
            end
        end
    end

endmodule