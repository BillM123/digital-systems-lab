module synchroniser (buttonIn, clk, buttonOut);
    input buttonIn;
    input clk;
    output reg buttonOut;
    wire meta;

    //2 flip-flops
    always @(posedge clk, posedge reset) begin
        if(reset) begin
            buttonOut <= 0;
        end
        else begin
            meta <= buttonIn;
            buttonOut <= meta; //meta connects 2 flip flops
        end
    end

endmodule
