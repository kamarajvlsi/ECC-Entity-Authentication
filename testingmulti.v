module testing1(a,b,load,clk);
  input[255:0]a,b;
  input load,clk;
  //output reg [3:0]out;
  wire y;
  wire co1,co2,cry;
  wire [255:0]muxout,adderout,feedback,u,e,muxoutwire,out1,out2,reg_p_help,reg_p2_help;
  assign reg_p_help=256'h00000000000000000000000000000007;
  assign reg_p2_help=256'h0000000000000000000000000000000E;
  Shiftregister_PISO g(clk,b,load,y);
  fullmodu r(a,u,e,cry);
  mux1 h(muxoutwire,e,u,y);
  subtra k(muxoutwire,reg_p_help,1'b0,out1,co1);
  subtra u1(muxoutwire,reg_p2_help,1'b0,out2,co2);
  mux2 o(muxout,muxoutwire,out1,out2,{co2,co1});
  ShiftRegister_PIPO w(load,muxout,feedback);
  fullmodu q(feedback,feedback,1'b0,adderout,cry);
  ShiftRegister_PIPO1 t(load,clk,adderout,u);
  
  
endmodule
module ShiftRegister_PIPO1(load,clk,Pi,Po);    ///////check two's complement block;;;;;
input [255:0]Pi;
input load,clk;
output reg [255:0]Po;
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
