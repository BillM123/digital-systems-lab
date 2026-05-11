module leddriver (reset, clk/*, rotate*/, an3, an2, an1, an0, char);
   
   input reset, clk/*, rotate*/;
   output reg an0, an1, an2, an3;
   output reg [3:0] char;

   reg [3:0] message [0:15];
   reg [3:0] counter;
   reg [3:0] pos;
   reg [3:0] posA, posB, posC, posD;
   reg [22:0] rotateCount;

   //handles anodes
   always @(posedge clk or posedge reset) begin //NOTE: if asychronous reset neither posedge or negedge: not synthesizable
      if(reset) begin
         counter <= 4'b0000;
         an0 <= 1'b1;
         an1 <= 1'b1;
         an2 <= 1'b1;
         an3 <= 1'b1;

         char <= 4'b0000;
      end
      else begin
         counter <= counter + 1;

         case (counter)
            4'b0010: begin
               an0 <= 1'b0;
               an1 <= 1'b1;
               an2 <= 1'b1;
               an3 <= 1'b1;
               char <= message[posA];
            end
            4'b0110: begin
               an0 <= 1'b1;
               an1 <= 1'b0;
               an2 <= 1'b1;
               an3 <= 1'b1;
               char <= message[posB];
            end
            4'b1010: begin
               an0 <= 1'b1;
               an1 <= 1'b1;
               an2 <= 1'b0;
               an3 <= 1'b1;
               char <= message[posC];
            end
            4'b1110: begin
               an0 <= 1'b1;
               an1 <= 1'b1;
               an2 <= 1'b1;
               an3 <= 1'b0;
               char <= message[posD];
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

   //handles char assignment
   always @(posedge clk or posedge reset) begin
      if(reset)begin
         pos <= 0;
         posA <= 0;
         posB <= 1;
         posC <= 2;
         posD <= 3;

         //boring message: 0123456789abcdef
         message[0] <= 4'b0000;
         message[1] <= 4'b0001;
         message[2] <= 4'b0010;
         message[3] <= 4'b0011;
         message[4] <= 4'b0100;
         message[5] <= 4'b0101;
         message[6] <= 4'b0110;
         message[7] <= 4'b0111;
         message[8] <= 4'b1000;
         message[9] <= 4'b1001;
         message[10] <= 4'b1010;
         message[11] <= 4'b1011;
         message[12] <= 4'b1100;
         message[13] <= 4'b1101;
         message[14] <= 4'b1110;
         message[15] <= 4'b1111;

         rotateCount <= 1; 

      end
      else begin
         rotateCount <= rotateCount+1;
         if(rotateCount == 0)begin //takes double the time to rotate after reset, why? (or add to report)
            pos <= pos+1;
            posA <= pos;
            posB <= pos+1;
            posC <= pos+2;
            posD <= pos+3;
         end
         
      end
   end

endmodule