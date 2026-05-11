//Also functions as a synchroniser
module antibounce (buttonIn, clk, buttonOut);
    input buttonIn;
    input clk;
    output reg buttonOut;
    reg /*[22:0]*/[3:0] counter;
    reg syncMid, syncOut;
    
    //synchroniser: two flip flops
    always @(posedge clk) begin
        syncMid <= buttonIn;
        syncOut <= syncMid;
    end
    //anti-bounce
    always @(posedge clk) begin
        if((syncMid == 1'b1 && syncOut == 1'b1) 
        || (syncMid == 1'b0 && syncOut == 1'b0)) 
			counter <= counter + 1;
		else
			counter <= 4'b0;
	
		if(counter >= /*23'b10000000000000000000000*/4'b1000) begin
			buttonOut <= syncMid;
			counter <= 4'b0;
		end
    end

endmodule
