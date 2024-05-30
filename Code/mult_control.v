module mult_control
(
input clk,
input reset_a,
input start,
input [1:0]count,
output reg [1:0]input_sel,
output reg [1:0]shift_sel,
output reg [2:0]state_out,
output reg done,
output reg clk_ena,
output reg sclr_n
);

reg [2:0]state_reg,state_next;

localparam IDLE = 3'b000;
localparam LSB  = 3'b001;
localparam MID  = 3'b010;
localparam MSB  = 3'b011;
localparam CALC_DONE =3'b100 ;
localparam ERR  = 3'b101 ;

/*State Register*/
 
always@(posedge clk,negedge reset_a)
begin
if(!reset_a)
state_reg<=IDLE;
else
state_reg<=state_next;
end

/*Next State Logic*/

always@(*)
begin
        
        input_sel = 2'b00;
        shift_sel = 2'b00;
        done =1'b0;
        clk_ena =1'b0;
        sclr_n = 1'b0;
        state_out=IDLE;
   case(state_reg)
   IDLE:
   begin
      state_out=IDLE;
       if(start==1'b1)
         begin
          state_next=LSB;
         input_sel=2'b00;
         shift_sel=2'b00;
         done=1'b0;
         clk_ena=1'b1;
         sclr_n=1'b0;
         end
        else
        begin
         state_next=IDLE;
         input_sel=2'b00;
         shift_sel=2'b00;
         done=1'b0;
         clk_ena=1'b0;
         sclr_n=1'b1;
       end
   end
LSB:
 begin
 state_out=LSB; 
    if( (start == 1'b0) && (count == 2'b00) )
     begin
        state_next=MID;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b1;
        sclr_n=1'b1;
     end
    else
     begin
        state_next=ERR;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b0;
        sclr_n=1'b1;
     end  
 end

MID:
begin
 state_out=MID;
  if( (start == 1'b0) && (count == 2'b01) )
   begin
        state_next=MID;
        input_sel=2'b01;
        shift_sel=2'b01;
        done=1'b0;
        clk_ena=1'b1;
        sclr_n=1'b1;
   end
  else if( (start == 1'b0) && (count == 2'b10) )
   begin
        state_next=MSB;
        input_sel=2'b10;
        shift_sel=2'b01;
        done=1'b0;
        clk_ena=1'b1;
        sclr_n=1'b1;     
   end 
  else
   begin
        state_next=ERR;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b0;
        sclr_n=1'b1;  
   end
end
MSB:
begin 
 state_out=MSB; 
 if((start == 1'b0) && (count == 2'b11))
  begin
        state_next=CALC_DONE;
        input_sel=2'b11;
        shift_sel=2'b10;
        done=1'b0;
        clk_ena=1'b1;
        sclr_n=1'b1;
  end
 else
  begin
  	state_next=ERR;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b0;
        sclr_n=1'b1;   
  end
end
CALC_DONE:
 begin
  state_out=CALC_DONE;
  if(start==1'b1)
   begin
 	state_next=ERR;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b0;
        sclr_n=1'b1;
   end
  else
   begin
  	state_next=IDLE;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b1;
        clk_ena=1'b0;
        sclr_n=1'b1;  
   end
end
ERR:
 begin
 state_out=ERR;
 if(start == 1'b1)
  begin
        state_next=LSB;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b1;
        sclr_n=1'b0;
  end
 else
  begin
	state_next=ERR;
        input_sel=2'b00;
        shift_sel=2'b00;
        done=1'b0;
        clk_ena=1'b0;
        sclr_n=1'b1;  
end 
end
default :
 begin
 state_next=state_reg;
 state_out=IDLE;
 end
endcase

end

endmodule
