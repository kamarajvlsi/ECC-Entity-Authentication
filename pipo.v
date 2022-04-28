module ShiftRegister_PIPO(load,Pi,Po);
input [255:0]Pi;
input load;
output reg [255:0]Po;
always @(Pi or posedge load)
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
