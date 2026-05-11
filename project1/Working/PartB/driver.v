module leddriver (reset, clk, an3, an2, an1, an0);
   
   input reset, clk;
   output reg an0, an1, an2, an3;
   reg [3:0] counter;

   always @(posedge clk or posedge reset) begin //NOTE: if asychronous reset neither posedge or negedge: not synthesizable
      if(reset) begin
         counter <= 4'b0000;
         an0 <= 1'b1;
         an1 <= 1'b1;
         an2 <= 1'b1;
         an3 <= 1'b1;
      end
      else begin
         counter <= counter + 1;

         case (counter)
            4'b0010: begin
               an0 <= 1'b0;
               an1 <= 1'b1;
               an2 <= 1'b1;
               an3 <= 1'b1;
            end
            4'b0110: begin
               an0 <= 1'b1;
               an1 <= 1'b0;
               an2 <= 1'b1;
               an3 <= 1'b1;
            end
            4'b1010: begin
               an0 <= 1'b1;
               an1 <= 1'b1;
               an2 <= 1'b0;
               an3 <= 1'b1;
            end
            4'b1110: begin
               an0 <= 1'b1;
               an1 <= 1'b1;
               an2 <= 1'b1;
               an3 <= 1'b0;
            end
            default: begin
               an0 <= 1'b1;
               an1 <= 1'b1;
               an2 <= 1'b1;
               an3 <= 1'b1;
            end
         endcase
      end
   end

endmodule