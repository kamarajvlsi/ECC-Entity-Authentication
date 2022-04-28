module mux2(c,a,b,d,s,clk);
  input [255:0]a,b,d;
  
  input [1:0]s;
  input clk;
  output reg [255:0]c;
  always @(s)
  begin 
   
  case(s)
    2'b00:c=d;//2p
    2'b11:c=a;//mux
    2'b01:c=b;//p
    default :c=256'b0;
  endcase
  end
endmodule
