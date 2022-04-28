module mux1(c,a,b,s,clk);
  input [255:0]a,b;
  
  input s;
  input clk;
  output reg [255:0]c;
  always @(s)
  begin 
   
  case(s)
    1'b0:c=a;
    1'b1:c=b;
    default :c=256'b0;
  endcase
  end
endmodule
    