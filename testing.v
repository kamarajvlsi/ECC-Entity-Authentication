module testing(a,b,pi,load,clk);
  input[3:0]a,b,pi;
  input load,clk;
  //output reg [3:0]out;
  reg [3:0]c;
  wire Serial_Out;
  wire co;
  wire [3:0]muxout,adderout,feedback,feedback1;
  
  
  Shiftregister_PISO p(clk,pi,load,Serial_Out);
  ShiftRegister_PIPO w(load,adderout,feedback);
  mux1 l(muxout,a,b,Serial_Out,clk);
  ShiftRegister_PIPO1 q(load,clk,feedback,feedback1);
  fullmodu u(muxout,feedback1,adderout,co);
  
endmodule
module ShiftRegister_PIPO1(load,clk,Pi,Po);
input [3:0]Pi;
input load,clk;
output reg [3:0]Po;
always @(posedge clk)
begin
  if(load)
    begin
      Po<=0;
    end
  else
    begin
      Po <= Pi;

    end
end

endmodule
